require 'spec_helper'

require 'eson/client'
require 'eson/dsl'
require 'eson/request'

describe Eson::Request do
  let(:client) { Eson::Client.new(protocol: Eson) }
  subject { Eson::Request.new(M, [], client) }

  before do
    M = Module.new do
      include Eson::API::DSL
    end
  end

  after do
    Object.send(:remove_const, :M)
  end

  describe 'creating two requests' do
    let(:request1) { Eson::Request.new(M, [], client) }
    let(:request2) { Eson::Request.new(M, [], client) }

    before do
      M.class_eval do
        url do
          set_base_path '/{index}'
          part :index, type: String, required: true

          params do
            string :foo
          end
          source_param :foo
        end
      end
      request1.url.params.foo = 'haha'
      request2.url.params.foo = 'hoho'
    end

    it 'returns different parameter values' do
      expect(request1.url.params.foo).to eq('haha')
      expect(request2.url.params.foo).to eq('hoho')
    end

    describe 'comparing requests' do
      it 'creates different url objects' do
        expect(request1.url.object_id).to_not eq(request2.url.object_id)
      end
    end
  end

  describe '#initialize' do
    context 'with valid arguments' do
      before do
        M.class_eval do
          url do
            params do
              string :foo
            end
          end
        end
      end

      it 'does not raise an error' do
        expect{ subject }.to_not raise_error
      end
    end
  end

  describe '#parameters=' do
    before do
      M.class_eval do
        url do
          params do
            string :foo
          end
        end
      end
    end

    it 'does not raise error when assigning valid values' do
      expect{ subject.parameters = { foo: 'test' } }.to_not raise_error
    end

    it 'raises NoMethodError when parameter name is not found' do
      expect{ subject.parameters = { bar: 'haha' } }.to raise_error(NoMethodError)
    end

    it 'raises ArgumentError when parameter type is different' do
      pending 'currently coercion is deactivated'
      expect{ subject.parameters = { foo: ['1', '2'] } }.to raise_error(ArgumentError)
    end
  end

  describe '#parts' do
    before do
      M.class_eval do
        url do
          path '/_base/{foo}/{bar}'
          part :foo, type: String, required: true
          part :bar, type: String
        end
      end
    end

    it 'does not raise error' do
      expect { subject.parts }.to_not raise_error
    end

    it 'returns list of parts names' do
      expect(subject.parts.names).to eq([:foo, :bar])
    end
  end

  describe '#source' do
    context 'with explicitly set parameter' do
      before do
        M.class_eval do
          url do
            params do
              string :name, 'test'
            end
            source_param :name, :foo
          end
        end
      end

      it 'does not raise error' do
        expect { subject.source }.to_not raise_error
      end

      it 'sets source parameter' do
        subject.parameters = { name: 'haha' }
        expect(subject.source).to eq({ "name" => "haha" }.to_json)
      end
    end

    context 'with implicitly set parameter' do
      before do
        M.class_eval do
          url do
            source_param :foo
          end
        end
      end

      it 'does not raise error' do
        expect { subject.source }.to_not raise_error
      end

      it 'sets source parameter' do
        subject.parameters = { foo: 'test' }
        expect(subject.source).to eq({ :foo => 'test' }.to_json)
      end
    end
  end
end

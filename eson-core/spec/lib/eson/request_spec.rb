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
  end
end

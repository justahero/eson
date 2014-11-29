require 'spec_helper'
require 'rspec/its'

require 'eson/dsl'
require 'eson/dsl/url_builder'

describe Eson::API::DSL::UrlBuilder do
  describe '#paths' do
    let(:builder) do
      Eson::API::DSL::UrlBuilder.new do
        path '/_cluster/health'
        path '/_cluster/health/{index}'
      end
    end
    subject { builder.paths }

    it { is_expected.to be_a(Array) }
    its(:size) { is_expected.to eq 2 }

    it 'returns two paths when fetchting multiple times' do
      expect(subject.size).to eq 2
      expect(subject.size).to eq 2
    end
  end

  describe '#params' do
    context 'with single block' do
      let(:builder) do
        Eson::API::DSL::UrlBuilder.new do
          params do
            string :foo
          end
        end
      end
      subject { builder.params }

      it { is_expected.to respond_to(:foo) }
    end

    context 'with single block and two parameters' do
      let(:builder) do
        Eson::API::DSL::UrlBuilder.new do
          params do
            string :foo
            string :bar
          end
        end
      end
      subject { builder.params }

      it { is_expected.to respond_to(:foo) }
      it { is_expected.to respond_to(:bar) }
    end

    context 'with multiple blocks and parameters' do
      let(:builder) do
        Eson::API::DSL::UrlBuilder.new do
          params do
            string :foo
          end
          params do
            string :bar
          end
        end
      end
      subject { builder.params }

      it { is_expected.to respond_to(:foo) }
      it { is_expected.to respond_to(:bar) }
    end
  end

  describe '#part' do
    context 'with a single index' do
      let(:builder) do
        Eson::API::DSL::UrlBuilder.new do
          path '/_cluster/health/{index}'
          part :index, type: String, required: true
        end
      end
      subject { builder.parts }

      it { is_expected.to respond_to(:index) }
    end

    context 'without required parts' do
      let(:builder) do
        Eson::API::DSL::UrlBuilder.new do
          path '/test/{foo}/'
          part :foo, type: String
        end
      end
      subject { builder.parts }

      it 'can return list of required parts only' do
        expect(subject.required).to eq []
      end
    end

    context 'with multiple parts' do
      let(:builder) do
        Eson::API::DSL::UrlBuilder.new do
          path '/test/{foo}/{bar}'
          part :foo, type: String, required: true
          part :bar, type: String
        end
      end
      subject { builder.parts }

      it 'can return required parts with single element' do
        expect(subject.required).to eq [:foo]
      end
    end
  end

  describe '#find_path' do
    subject { builder.find_path }
    let(:builder) do
      Eson::API::DSL::UrlBuilder.new do
        path '/test/'
        path '/test/{index}/'
        path '/test/{type}/'
        path '/test/{index}/{type}/'

        part :index, type: String
        part :type, type: String
      end
    end

    context 'without any given parts' do
      it { is_expected.to eq '/test/' }
    end

    context 'with part :index' do
      before { builder.parts.index = 'foo' }
      it { is_expected.to eq '/test/foo/' }
    end

    context 'with path :type' do
      before { builder.parts.type = 'bar' }
      it { is_expected.to eq '/test/bar/' }
    end

    context 'with all parts' do
      before do
        builder.parts.index = 'foo'
        builder.parts.type  = 'bar'
      end

      it { is_expected.to eq '/test/foo/bar/' }
    end
  end

  describe '#query_values' do
    subject { builder.query_values }
    let(:builder) do
      Eson::API::DSL::UrlBuilder.new do
        params do
          enum :foo, ['1', '2'], '1'
          string :bar, 'test'
        end
      end
    end

    it 'does not raise error' do
      expect { subject }.to_not raise_error
    end

    it 'returns valid query string' do
      expect(subject).to eq({ foo: '1', bar: 'test' })
    end
  end
end

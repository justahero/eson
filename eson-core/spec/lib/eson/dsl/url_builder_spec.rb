require 'spec_helper'
require 'rspec/its'

require 'eson/dsl'
require 'eson/dsl/url_builder'

describe Eson::API::DSL::UrlBuilder do
  describe '#paths' do
    let(:builder) do
      args = {
        :paths => ['/_cluster/health', '/_cluster/health/{index}']
      }
      Eson::API::DSL::UrlBuilder.new(args)
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
        args = {
          :params => { foo: { type: 'string' } }
        }
        Eson::API::DSL::UrlBuilder.new(args)
      end
      subject { builder.params }

      it { is_expected.to respond_to(:foo) }
    end

    context 'with single block and two parameters' do
      let(:builder) do
        args = {
          :params => {
            foo: { type: 'string' },
            bar: { type: 'string' }
          }
        }
        Eson::API::DSL::UrlBuilder.new(args)
      end
      subject { builder.params }

      it { is_expected.to respond_to(:foo) }
      it { is_expected.to respond_to(:bar) }
    end
  end

  describe '#part' do
    context 'with a single index' do
      let(:builder) do
        args = {
          :paths => ['/_cluster/health/{index}'],
          :parts => {
            index: { type: String, required: true }
          }
        }
        Eson::API::DSL::UrlBuilder.new(args)
      end
      subject { builder.parts }

      it { is_expected.to respond_to(:index) }
    end

    context 'without required parts' do
      let(:builder) do
        args = {
          :paths => ['/test/{foo}/'],
          :parts => {
            foo: { type: String }
          }
        }
        Eson::API::DSL::UrlBuilder.new(args)
      end
      subject { builder.parts }

      it 'can return list of required parts only' do
        expect(subject.required).to eq []
      end
    end

    context 'with multiple parts' do
      let(:builder) do
        args = {
          :paths => ['/test/{foo}/{bar}'],
          :parts => {
            foo: { type: String, required: true },
            bar: { type: String }
          }
        }
        Eson::API::DSL::UrlBuilder.new(args)
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
      args = {
        paths: ['/test/', '/test/{index}/', '/test/{type}/', '/test/{index}/{type}/'],
        parts: {
          index: { type: String }, type: { type: String }
        }
      }
      Eson::API::DSL::UrlBuilder.new(args)
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
      args = {
        params: {
          foo: { type: 'enum', values: ['1', '2'], default: '1' },
          bar: { type: 'string' }
        }
      }
      Eson::API::DSL::UrlBuilder.new(args)
    end

    it 'does not raise error' do
      expect { subject }.to_not raise_error
    end

    it 'returns valid query string' do
      expect(subject).to eq({ foo: '1' })
    end

    it 'returns list with full values after setting all parameters' do
      builder.params.bar = 'test'
      expect(subject).to eq({ foo: '1', bar: 'test'})
    end
  end

  describe '#source_values' do
    subject { builder.source_values }
    let(:builder) do
      args = {
        params: {
          foo: { type: 'string', default: 'test' },
          bar: { type: 'string', default: 'no' },
        },
        source_params: ['foo']
      }
      Eson::API::DSL::UrlBuilder.new(args)
    end

    it 'does not raise error' do
      expect { subject }.to_not raise_error
    end

    it 'returns list with correct values' do
      expect(subject).to eq({ foo: 'test' })
    end
  end
end

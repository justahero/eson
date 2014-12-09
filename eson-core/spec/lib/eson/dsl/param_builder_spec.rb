require 'spec_helper'

require 'eson/dsl'
require 'eson/dsl/param_builder'

describe Eson::API::DSL::ParamBuilder do
  shared_examples 'a valid parameter' do |name, value, default = nil|
    it 'does not raise error' do
      expect { subject }.to_not raise_error
    end

    it { is_expected.to respond_to(name.to_sym) }

    it "returns set value #{value}" do
      expect(subject.send(name.to_sym)).to eq value
    end

    it 'sets nil as value' do
      expect { subject.send("#{name.to_sym}=", default) }.to_not raise_error
      expect(subject.send(name.to_sym)).to eq default
    end

    it { is_expected.to respond_to(:attributes) }
  end

  describe '#initialize' do
    context 'without block' do
      subject { Eson::API::DSL::ParamBuilder.new }

      it 'does not raise error' do
        expect { subject }.to_not raise_error
      end

      it { is_expected.to respond_to(:attributes) }
    end

    context 'with empty block' do
      subject { Eson::API::DSL::ParamBuilder.new {} }

      it 'does not raise error' do
        expect { subject }.to_not raise_error
      end

      it { is_expected.to respond_to(:attributes) }
    end

    describe 'add enum parameter' do
      subject do
        args = { foo: { type: 'enum', values: ['1', '2'], default: '1' } }
        Eson::API::DSL::ParamBuilder.new(args)
      end

      it_behaves_like 'a valid parameter', :foo, '1'

      it 'can set default value 1' do
        expect { subject.foo = '1' }.to_not raise_error
      end

      it 'can set default value to a list of enum values' do
        expect { subject.foo = ['1', '2'] }.to_not raise_error
      end

      it 'raise ArgumentError if unknown enum value' do
        expect { subject.foo = '3' }.to raise_error(ArgumentError)
      end
    end

    describe 'add string parameter' do
      subject do
        args = { bar: { type: 'string', default: 'haha' } }
        Eson::API::DSL::ParamBuilder.new(args)
      end

      it_behaves_like 'a valid parameter', :bar, 'haha'
    end

    describe 'add boolean parameter' do
      subject do
        args = { foo: { type: 'boolean', default: false } }
        Eson::API::DSL::ParamBuilder.new(args)
      end

      it_behaves_like 'a valid parameter', :foo, false
    end

    describe 'add number parameter' do
      subject do
        args = { level: { type: 'number', default: 123 } }
        Eson::API::DSL::ParamBuilder.new(args)
      end

      it_behaves_like 'a valid parameter', :level, 123
    end

    describe 'add time parameter' do
      subject do
        args = { created_at: { type: 'time', default: DateTime.new(2014, 10, 12) } }
        Eson::API::DSL::ParamBuilder.new(args)
      end

      it_behaves_like 'a valid parameter', :created_at, DateTime.new(2014, 10, 12).to_s
    end

    describe 'add list parameter' do
      subject do
        args = { h: { type: 'list', default: ['name', 'email'] } }
        Eson::API::DSL::ParamBuilder.new(args)
      end

      it_behaves_like 'a valid parameter', :h, ['name', 'email'], []
    end

    describe 'add text parameter' do
      subject do
        args = { suggest_text: { type: 'text', default: 'TEXT' } }
        Eson::API::DSL::ParamBuilder.new(args)
      end

      it_behaves_like 'a valid parameter', :suggest_text, 'TEXT'
    end
  end
end

require 'spec_helper'

require 'lib/eson/chainable'
require 'lib/eson/api'
require 'lib/eson/transform/generator'

describe Eson::Transform::Generator do
  describe '#initialize' do
    context 'with empty hash' do
      it 'does not raise error' do
        expect { Eson::Transform::Generator.new({}) }.to_not raise_error
      end
    end

    context 'with sample "cluster.health"' do
      let(:sample) { load_api_sample('cluster.health') }
      subject { Eson::Transform::Generator.new(sample) }

      it 'does not raise error' do
        expect { subject }.to_not raise_error
      end
    end
  end

  describe '#ruby_content' do
    context 'with sample "cluster.health"' do
      let(:sample) { load_api_sample('cluster.health') }
      let(:source) { Eson::Transform::Generator.new(sample).ruby_content }
      let!(:module) { eval(source) }

      it 'creates module Eson::Shared::Cluster::Health' do
        exists = Object.const_defined?('Eson::Shared::Cluster::Health')
        expect(exists).to eq true
      end

      context 'with concrete class' do
        before do
          class ApiTest
            include Eson::Shared::Cluster::Health
          end
        end
        subject(:api) { ApiTest.new.url.params }

        it { is_expected.to respond_to(:level) }
        it { is_expected.to respond_to(:local) }
        it { is_expected.to respond_to(:master_timeout) }
        it { is_expected.to respond_to(:timeout) }
        it { is_expected.to respond_to(:wait_for_active_shards) }
        it { is_expected.to respond_to(:wait_for_nodes) }
        it { is_expected.to respond_to(:wait_for_relocating_shards) }
        it { is_expected.to respond_to(:wait_for_status) }
      end
    end
  end
end

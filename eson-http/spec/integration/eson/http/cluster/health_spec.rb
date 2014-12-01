require 'spec_helper'

require 'eson/http/cluster/health'

describe 'Eson::HTTP::Cluster::Health' do
  context '/_cluster/health/' do
    subject(:response) { es_client.cluster_health }

    it_behaves_like 'a valid API response'
  end

  context '/_cluster/health/{index}' do
    before do
      es_client.create_index :index => 'test'
    end

    subject(:response) { es_client.cluster_health :index => 'test' }

    it_behaves_like 'a valid API response'
  end
end

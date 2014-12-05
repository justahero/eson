require 'spec_helper'
require 'elasticsearch-node/external'

describe 'Eson::HTTP::Cluster::Reroute', api: :cluster do
  let(:params) { {} }
  subject(:response) { es_client.reroute params }

  before do
    settings = {
      'index' => {
        'number_of_shards' => 2,
        'number_of_replicas' => 0
      }
    }
    es_client.create_index index: 'test', settings: settings
  end

  context 'with :commands body' do
    before do
      status = JSON.parse(es_client.recovery(index: 'test').body)

      node1 = status['test']['shards'].first['source']['id']
      node2 = status['test']['shards'].last['source']['id']

      params[:commands] = [
        {
          'move' => {
            'index' => 'test', 'shard' => 0,
            'from_node' => node1, 'to_node' => node2
          }
        }
      ]
      params[:dry_run] = true
    end

    it_behaves_like 'a valid API response'

    it_behaves_like 'an acknowledged response'
  end
end

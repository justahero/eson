require 'spec_helper'

require 'eson/http/cluster/put_settings'

describe 'Eson::HTTP::Cluster::PutSettings' do
  let(:params) { {} }
  subject(:response) { es_client.cluster_put_settings params }

  context 'without body parameters' do
    it_behaves_like 'a valid API response', 400

    it { is_expected.to match_json_schema('cluster/put_settings') }
  end

  context 'with body arguments' do
    before do
      params[:timeout] = 200
      params[:master_timeout] = 500
      params[:transient] = { "indices.cache.filter.size" => "10%" }
    end

    it_behaves_like 'a valid API response'

    it_behaves_like 'an acknowledged response'

    it { is_expected.to match_json_schema('cluster/put_settings') }
  end
end

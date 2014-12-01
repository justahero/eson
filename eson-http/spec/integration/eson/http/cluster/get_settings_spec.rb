require 'spec_helper'

require 'eson/http/cluster/get_settings'

describe 'Eson::HTTP::Cluster::GetSettings' do
  let(:params) { {} }
  subject(:response) { es_client.cluster_get_settings params }

  it_behaves_like 'a valid API response'

  context 'with all parameters' do
    before do
      params[:flat_settings]  = true
      params[:master_timeout] = '10'
      params[:timeout]        = '10'
    end

    it_behaves_like 'a valid API response'
  end
end

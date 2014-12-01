require 'spec_helper'

require 'eson/http/cluster/put_settings'

describe 'Eson::HTTP::Cluster::PutSettings' do
  let(:params) { {} }
  subject(:response) { es_client.cluster_put_settings params }

  it_behaves_like 'a valid API response'

  context 'with parameter :flat_settings' do
    before do
      params[:flat_settings]  = true
    end

    it_behaves_like 'a valid API response'
  end
end

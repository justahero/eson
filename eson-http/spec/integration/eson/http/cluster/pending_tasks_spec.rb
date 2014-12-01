require 'spec_helper'

require 'eson/http/cluster/pending_tasks'

describe 'Eson::HTTP::Cluster::PendingTasks' do
  let(:params) { {} }
  subject(:response) { es_client.pending_tasks params }

  it_behaves_like 'a valid API response'

  context 'with query values' do
    let(:params) { { local: true } }

    it_behaves_like 'a valid API response'
  end
end

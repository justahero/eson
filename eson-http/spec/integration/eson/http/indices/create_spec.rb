require 'spec_helper'

require 'pry'

describe 'Eson::HTTP::Indices::Create' do
  let(:params) { { index: 'test' } }
  subject(:response) { es_client.create_index params }

  context 'without body arguments' do
    it_behaves_like 'a valid API response'

    it_behaves_like 'an acknowledged response'
  end

  context 'with :settings source argument' do
    before do
      params[:settings] = {
        'index' => {
          'number_of_shards' => 2,
          'number_of_replicas' => 1
        }
      }
    end

    it_behaves_like 'a valid API response'

    it_behaves_like 'an acknowledged response'
  end
end

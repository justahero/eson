require 'spec_helper'

require 'pry'

describe 'Eson::HTTP::Indices::Create' do
  let(:params) { {} }
  subject(:response) { es_client.create_index params }

  context 'with valid index argument' do
    before do
      params[:index] = 'test'
    end

    it_behaves_like 'a valid API response'

    it_behaves_like 'an acknowledged response'
  end
end

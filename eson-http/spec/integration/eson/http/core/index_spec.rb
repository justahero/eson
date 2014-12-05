require 'spec_helper'

describe 'Eson::HTTP::Core::Index' do
  let(:params) { {} }
  subject(:response) { es_client.index params }

  before do
    es_client.create_index index: 'test'
    params[:index] = 'test'
    params[:type]  = 'type'
  end

  context 'without :id' do
    before do
      params[:doc] = { 'foo' => 'bar' }
    end

    it_behaves_like 'a valid API response', 201
  end

  context 'with id' do
    before do
      params[:doc] = { 'foo' => 'bar' }
      params[:id]  = '111'
    end

    it_behaves_like 'a valid API response', 201
  end
end

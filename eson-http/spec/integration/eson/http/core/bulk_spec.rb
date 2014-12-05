require 'spec_helper'

describe 'Eson::HTTP::Core::Bulk' do
  def count
    response = es_client.count index: 'test', type: 'bar'
    result = JSON.parse(response.body)
    result.fetch('count') { 0 }
  end

  before do
    es_client.create_index index: 'test'
  end

  context 'without block' do
  end

  context 'with block' do
    describe 'indexing documents' do
      let(:total) { 10 }
      subject(:response) do
        es_client.bulk(refresh: true) do |request|
          1.upto(total) do |i|
            request.index index: 'test', type: 'bar', doc: { 'foo' => i }, ttl: 10
          end
        end
      end

      it_behaves_like 'a valid API response'

      it 'creates correct number of documents' do
        subject
        expect(count).to eq total
      end
    end
  end
end

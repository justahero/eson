require 'spec_helper'

require 'eson/http/core/abort_benchmark'

describe 'Eson::HTTP::Core::AbortBenchmark' do
  context 'without a benchmark' do
    it 'does not raise error' do
      expect { es_client.abort_benchmark name: 'foo' }.to_not raise_error
    end

    it 'returns status code 200' do
      response = es_client.abort_benchmark name: 'foo'
      expect(response.status).to eq 200
    end

    it 'returns JSON response' do
      response = es_client.abort_benchmark name: 'foo'
      expect(valid_json?(response.body)).to eq true
    end
  end
end

require 'spec_helper'

require 'eson/http/core/abort_benchmark'

describe 'Eson::HTTP::Core::AbortBenchmark' do
  it 'does not raise error' do
    expect { es_client.abort_benchmark name: 'foo' }.to_not raise_error
  end

  it 'returns status code 200' do
    es_client.abort_benchmark name: 'foo'
    expect(last_response.status).to eq 200
  end

  it 'returns JSON response' do
  end
end

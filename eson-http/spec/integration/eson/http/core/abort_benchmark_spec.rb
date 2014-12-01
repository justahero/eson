require 'spec_helper'

require 'eson/http/core/abort_benchmark'

describe 'Eson::HTTP::Core::AbortBenchmark' do
  context 'without a benchmark' do
    subject(:response) { es_client.abort_benchmark name: 'foo' }

    it_behaves_like 'a valid API response', 404
  end
end

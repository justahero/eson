require 'spec_helper'

describe 'Eson::HTTP::Indices::Delete' do
  let(:params) { { index: 'test' } }
  let(:client) do
    node = Node::External.instance
    Eson::Client.new(
      server: "http://#{node.ip}:#{node.port}",
      logger: '/dev/null',
      plugins: [Eson::StatusHandler]
    )
  end
  subject(:response) { client.delete_index params }

  context 'without any index' do
    it 'raises IndexNotFoundError' do
      expect{ subject }.to raise_error(Eson::IndexNotFoundError)
    end
  end

  context 'with existing index' do
    before do
      es_client.create_index index: 'test'
    end

    it_behaves_like 'a valid API response'

    it_behaves_like 'an acknowledged response'
  end
end

require 'spec_helper'

require 'eson/http/indices/exists'
require 'eson/http/request'

describe Eson::HTTP::Request do
  let(:node) { Node::External.instance }
  let(:server) { "http://#{node.ip}:#{node.port}" }
  let(:client) { Eson::HTTP::Client.new(server: server) }

  describe '#fill' do
    let(:http_module) { Eson::HTTP::Indices::Exists }
    subject { Eson::HTTP::Request.new(http_module, [], client) }

    it 'does not raise error' do
      expect { subject.fill }.to_not raise_error
    end
  end
end

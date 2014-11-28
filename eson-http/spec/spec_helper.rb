require 'rack/test'
require 'rspec'
require 'rspec/its'

require 'simplecov'
require 'simplecov-console'

load 'setup.rb'

require 'eson-core'

RSpec.configure do |c|
  c.include Rack::Test::Methods

  c.before(:each) do
  end

  c.after(:each) do
    delete_all_index
  end
end

def es_client
  node = Node::External.instance
  @client ||= Eson::Client.new(:server => "http://#{node.ip}:#{node.port}", :protocol => Eson::HTTP)
end

def delete_all_indexes
  es_client.delete_index index: '_all'
rescue
end

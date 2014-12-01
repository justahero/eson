require 'json'
require 'rack/test'
require 'rspec'
require 'rspec/its'

require 'simplecov'
require 'simplecov-console'

load 'setup.rb'

Dir.glob("#{File.dirname(__FILE__)}/support/**/*.rb").each { |f| require f }

require 'eson-core'
require 'eson-http'

RSpec.configure do |c|
  c.include Eson::Support::Spec::JSON

  c.before(:each) do
    delete_all_indexes
  end

  c.after(:each) do
  end
end

def es_client
  node = Node::External.instance
  @client ||= Eson::Client.new(:server => "http://#{node.ip}:#{node.port}", logger: '/dev/null')
end

def delete_all_indexes
  es_client.delete_index index: '_all'
rescue
end

def put_request(path, body = {})
  node = Node::External.instance
  http = Net::HTTP.new(node.ip, node.port)
  request = Net::HTTP::Put.new(path)
  request.body = body.to_json unless body.empty?
  request.content_type = 'application/json'
  http.request(request)
end

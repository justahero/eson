require 'elasticsearch-node/external'

module Node
  module External
    def self.create
      node = ElasticSearch::Node::External.new("gateway.type" => "none", "cluster.name" => "eson-test")
      at_exit do
        node.close
      end
      node
    end

    def self.instance
      @node ||= create
    end
  end
end

# initialize
Node::External.instance

require 'elasticsearch-node/external'

module Node
  module External
    def self.instance
      @node ||= begin
        node = ElasticSearch::Node::External.new("gateway.type" => "none", "cluster.name" => "eson-test")
        at_exit do
          node.close
        end
        node
      end
    end
  end
end

# initialize
Node::External.instance

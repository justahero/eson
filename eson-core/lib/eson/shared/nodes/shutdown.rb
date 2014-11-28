# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/cluster-nodes-shutdown.html

module Eson
  module Shared
    module Nodes
      module Shutdown
        include Eson::API::DSL

        request_methods :post

        url do
          set_base_path '/_shutdown'
          path '/_shutdown'
          path '/_cluster/nodes/_shutdown'
          path '/_cluster/nodes/{node_id}/_shutdown'

          part :node_id, type: String

          params do
            time :delay
            boolean :exit
          end
        end
      end
    end
  end
end

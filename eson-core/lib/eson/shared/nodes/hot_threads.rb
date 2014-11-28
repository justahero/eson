# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/cluster-nodes-hot-threads.html

module Eson
  module Shared
    module Nodes
      module HotThreads
        include Eson::API::DSL

        request_methods :get

        url do
          set_base_path '/_nodes/hot_threads'
          path '/_cluster/nodes/hotthreads'
          path '/_cluster/nodes/hot_threads'
          path '/_cluster/nodes/{node_id}/hotthreads'
          path '/_cluster/nodes/{node_id}/hot_threads'
          path '/_nodes/hotthreads'
          path '/_nodes/hot_threads'
          path '/_nodes/{node_id}/hotthreads'
          path '/_nodes/{node_id}/hot_threads'

          part :node_id, type: String

          params do
            time :interval
            number :snapshots
            number :threads
            enum :type, ["cpu", "wait", "block"], nil
          end
        end
      end
    end
  end
end

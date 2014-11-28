# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/cluster-nodes-stats.html

module Eson
  module Shared
    module Nodes
      module Stats
        include Eson::API::DSL

        request_methods :get

        url do
          set_base_path '/_nodes/stats'
          path '/_nodes/stats'
          path '/_nodes/{node_id}/stats'
          path '/_nodes/stats/{metric}'
          path '/_nodes/{node_id}/stats/{metric}'
          path '/_nodes/stats/{metric}/{index_metric}'
          path '/_nodes/{node_id}/stats/{metric}/{index_metric}'

          part :metric, type: String
          part :index_metric, type: String
          part :node_id, type: String

          params do
            list :completion_fields
            list :fielddata_fields
            list :fields
            boolean :groups
            boolean :human
            enum :level, ["node", "indices", "shards"], "node"
            list :types
          end
        end
      end
    end
  end
end

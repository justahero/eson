# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/cluster-stats.html

module Eson
  module Shared
    module Cluster
      module Stats
        include Eson::API::DSL

        request_methods :get

        url do
          set_base_path '/_cluster/stats'
          path '/_cluster/stats'
          path '/_cluster/stats/nodes/{node_id}'

          part :node_id, type: String

          params do
            boolean :flat_settings
            boolean :human
          end
        end
      end
    end
  end
end

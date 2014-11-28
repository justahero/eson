# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/cluster-health.html

module Eson
  module Shared
    module Cluster
      module Health
        include Eson::API::DSL

        request_methods :get

        url do
          set_base_path '/_cluster/health'
          path '/_cluster/health'
          path '/_cluster/health/{index}'

          part :index, type: String

          params do
            enum :level, ["cluster", "indices", "shards"], "cluster"
            boolean :local
            time :master_timeout
            time :timeout
            number :wait_for_active_shards
            string :wait_for_nodes
            number :wait_for_relocating_shards
            enum :wait_for_status, ["green", "yellow", "red"], nil
          end
        end
      end
    end
  end
end

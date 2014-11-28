# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/cluster-state.html

module Eson
  module Shared
    module Cluster
      module State
        include Eson::API::DSL

        request_methods :get

        url do
          set_base_path '/_cluster/state'
          path '/_cluster/state'
          path '/_cluster/state/{metric}'
          path '/_cluster/state/{metric}/{index}'

          part :index, type: String
          part :metric, type: String

          params do
            boolean :local
            time :master_timeout
            boolean :flat_settings
          end
        end
      end
    end
  end
end

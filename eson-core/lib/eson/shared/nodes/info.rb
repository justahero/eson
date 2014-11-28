# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/cluster-nodes-info.html

module Eson
  module Shared
    module Nodes
      module Info
        include Eson::API::DSL

        request_methods :get

        url do
          set_base_path '/_nodes'
          path '/_nodes'
          path '/_nodes/{node_id}'
          path '/_nodes/{metric}'
          path '/_nodes/{node_id}/{metric}'

          part :node_id, type: String
          part :metric, type: String

          params do
            boolean :flat_settings
            boolean :human
          end
        end
      end
    end
  end
end

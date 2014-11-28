# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/indices-stats.html

module Eson
  module Shared
    module Indices
      module Stats
        include Eson::API::DSL

        request_methods :get

        url do
          set_base_path '/_stats'
          path '/_stats'
          path '/_stats/{metric}'
          path '/{index}/_stats'
          path '/{index}/_stats/{metric}'

          part :index, type: String
          part :metric, type: String

          params do
            list :completion_fields
            list :fielddata_fields
            list :fields
            list :groups
            boolean :human
            enum :level, ["cluster", "indices", "shards"], "indices"
            list :types
          end
        end
      end
    end
  end
end

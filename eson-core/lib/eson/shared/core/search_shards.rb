# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/search-shards.html

module Eson
  module Shared
    module Core
      module SearchShards
        include Eson::API::DSL

        request_methods :get, :post

        url do
          set_base_path '/{index}/{type}/_search_shards'
          path '/_search_shards'
          path '/{index}/_search_shards'
          path '/{index}/{type}/_search_shards'

          part :index, type: String, required: false
          part :type, type: String, required: false

          params do
            string :preference
            string :routing
            boolean :local
            boolean :ignore_unavailable
            boolean :allow_no_indices
            enum :expand_wildcards, ["open", "closed"], "open"
          end
        end
      end
    end
  end
end

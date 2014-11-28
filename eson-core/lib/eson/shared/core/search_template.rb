# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/current/search-template.html

module Eson
  module Shared
    module Core
      module SearchTemplate
        include Eson::API::DSL

        request_methods :get, :post

        url do
          set_base_path '/_search/template'
          path '/_search/template'
          path '/{index}/_search/template'
          path '/{index}/{type}/_search/template'

          part :index, type: String
          part :type, type: String

          params do
            boolean :ignore_unavailable
            boolean :allow_no_indices
            enum :expand_wildcards, ["open", "closed"], "open"
            string :preference
            list :routing
            duration :scroll
            enum :search_type, ["query_then_fetch", "query_and_fetch", "dfs_query_then_fetch", "dfs_query_and_fetch", "count", "scan"], nil
          end
        end
      end
    end
  end
end

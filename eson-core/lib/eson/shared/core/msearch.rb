# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/search-multi-search.html

module Eson
  module Shared
    module Core
      module Msearch
        include Eson::API::DSL

        request_methods :get, :post

        url do
          set_base_path '/_msearch'
          path '/_msearch'
          path '/{index}/_msearch'
          path '/{index}/{type}/_msearch'

          part :index, type: String
          part :type, type: String

          params do
            enum :search_type, ["query_then_fetch", "query_and_fetch", "dfs_query_then_fetch", "dfs_query_and_fetch", "count", "scan"], nil
          end
        end
      end
    end
  end
end

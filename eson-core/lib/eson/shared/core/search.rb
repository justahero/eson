# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/search-search.html

module Eson
  module Shared
    module Core
      module Search
        include Eson::API::DSL

        request_methods :get, :post

        url do
          set_base_path '/_search'
          path '/_search'
          path '/{index}/_search'
          path '/{index}/{type}/_search'

          part :index, type: String
          part :type, type: String

          params do
            string :analyzer
            boolean :analyze_wildcard
            enum :default_operator, ["AND", "OR"], "OR"
            string :df
            boolean :explain
            list :fields
            number :from
            boolean :ignore_unavailable
            boolean :allow_no_indices
            enum :expand_wildcards, ["open", "closed"], "open"
            boolean :lenient
            boolean :lowercase_expanded_terms
            string :preference
            string :q
            list :routing
            duration :scroll
            enum :search_type, ["query_then_fetch", "query_and_fetch", "dfs_query_then_fetch", "dfs_query_and_fetch", "count", "scan"], nil
            number :size
            list :sort
            string :source
            list :_source
            list :_source_exclude
            list :_source_include
            list :stats
            string :suggest_field
            enum :suggest_mode, ["missing", "popular", "always"], "missing"
            number :suggest_size
            text :suggest_text
            time :timeout
            boolean :track_scores
            boolean :version
            boolean :query_cache
          end
        end
      end
    end
  end
end

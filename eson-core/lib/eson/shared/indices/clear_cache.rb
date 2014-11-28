# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/indices-clearcache.html

module Eson
  module Shared
    module Indices
      module ClearCache
        include Eson::API::DSL

        request_methods :post, :get

        url do
          set_base_path '/_cache/clear'
          path '/_cache/clear'
          path '/{index}/_cache/clear'

          part :index, type: String

          params do
            boolean :field_data
            boolean :fielddata
            list :fields
            boolean :filter
            boolean :filter_cache
            boolean :filter_keys
            boolean :id
            boolean :id_cache
            boolean :ignore_unavailable
            boolean :allow_no_indices
            enum :expand_wildcards, ["open", "closed"], "open"
            list :index
            boolean :recycler
            boolean :query_cache
          end
        end
      end
    end
  end
end

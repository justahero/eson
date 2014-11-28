# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/indices-put-mapping.html

module Eson
  module Shared
    module Indices
      module PutMapping
        include Eson::API::DSL

        request_methods :put, :post

        url do
          set_base_path '/{index}/{type}/_mapping'
          path '/{index}/{type}/_mapping'
          path '/{index}/_mapping/{type}'
          path '/_mapping/{type}'
          path '/{index}/{type}/_mappings'
          path '/{index}/_mappings/{type}'
          path '/_mappings/{type}'

          part :index, type: String
          part :type, type: String, required: true

          params do
            boolean :ignore_conflicts
            time :timeout
            time :master_timeout
            boolean :ignore_unavailable
            boolean :allow_no_indices
            enum :expand_wildcards, ["open", "closed"], "open"
          end
        end
      end
    end
  end
end

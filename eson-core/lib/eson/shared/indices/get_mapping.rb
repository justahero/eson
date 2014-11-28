# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/indices-get-mapping.html

module Eson
  module Shared
    module Indices
      module GetMapping
        include Eson::API::DSL

        request_methods :get

        url do
          set_base_path '/_mapping'
          path '/_mapping'
          path '/{index}/_mapping'
          path '/_mapping/{type}'
          path '/{index}/_mapping/{type}'

          part :index, type: String
          part :type, type: String

          params do
            boolean :ignore_unavailable
            boolean :allow_no_indices
            list :expand_wildcards
            boolean :local
          end
        end
      end
    end
  end
end

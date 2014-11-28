# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/indices-get-field-mapping.html

module Eson
  module Shared
    module Indices
      module GetFieldMapping
        include Eson::API::DSL

        request_methods :get

        url do
          set_base_path '/_mapping/field/{field}'
          path '/_mapping/field/{field}'
          path '/{index}/_mapping/field/{field}'
          path '/_mapping/{type}/field/{field}'
          path '/{index}/_mapping/{type}/field/{field}'

          part :index, type: String
          part :type, type: String
          part :field, type: String, required: true

          params do
            boolean :include_defaults
            boolean :ignore_unavailable
            boolean :allow_no_indices
            enum :expand_wildcards, ["open", "closed"], "open"
            boolean :local
          end
        end
      end
    end
  end
end

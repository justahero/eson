# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/search-validate.html

module Eson
  module Shared
    module Indices
      module ValidateQuery
        include Eson::API::DSL

        request_methods :get, :post

        url do
          set_base_path '/_validate/query'
          path '/_validate/query'
          path '/{index}/_validate/query'
          path '/{index}/{type}/_validate/query'

          part :index, type: String
          part :type, type: String

          params do
            boolean :explain
            boolean :ignore_unavailable
            boolean :allow_no_indices
            enum :expand_wildcards, ["open", "closed"], "open"
            string :operation_threading
            string :source
            string :q
          end
        end
      end
    end
  end
end

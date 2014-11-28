# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/search-percolate.html

module Eson
  module Shared
    module Core
      module Mpercolate
        include Eson::API::DSL

        request_methods :get, :post

        url do
          set_base_path '/_mpercolate'
          path '/_mpercolate'
          path '/{index}/_mpercolate'
          path '/{index}/{type}/_mpercolate'

          part :index, type: String
          part :type, type: String

          params do
            boolean :ignore_unavailable
            boolean :allow_no_indices
            enum :expand_wildcards, ["open", "closed"], "open"
          end
        end
      end
    end
  end
end

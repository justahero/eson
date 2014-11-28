# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/search-exists.html

module Eson
  module Shared
    module Core
      module SearchExists
        include Eson::API::DSL

        request_methods :post, :get

        url do
          set_base_path '/_search/exists'
          path '/_search/exists'
          path '/{index}/_search/exists'
          path '/{index}/{type}/_search/exists'

          part :index, type: String
          part :type, type: String

          params do
            boolean :ignore_unavailable
            boolean :allow_no_indices
            enum :expand_wildcards, ["open", "closed"], "open"
            number :min_score
            string :preference
            string :routing
            string :source
          end
        end
      end
    end
  end
end

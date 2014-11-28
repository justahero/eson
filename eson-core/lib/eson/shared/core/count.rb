# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/search-count.html

module Eson
  module Shared
    module Core
      module Count
        include Eson::API::DSL

        request_methods :post, :get

        url do
          set_base_path '/_count'
          path '/_count'
          path '/{index}/_count'
          path '/{index}/{type}/_count'

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

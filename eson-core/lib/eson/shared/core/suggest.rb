# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/search-suggesters.html

module Eson
  module Shared
    module Core
      module Suggest
        include Eson::API::DSL

        request_methods :post, :get

        url do
          set_base_path '/_suggest'
          path '/_suggest'
          path '/{index}/_suggest'

          part :index, type: String

          params do
            boolean :ignore_unavailable
            boolean :allow_no_indices
            enum :expand_wildcards, ["open", "closed"], "open"
            string :preference
            string :routing
            string :source
          end
        end
      end
    end
  end
end

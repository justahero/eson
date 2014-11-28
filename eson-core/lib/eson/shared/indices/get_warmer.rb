# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/indices-warmers.html

module Eson
  module Shared
    module Indices
      module GetWarmer
        include Eson::API::DSL

        request_methods :get

        url do
          set_base_path '/_warmer'
          path '/_warmer'
          path '/{index}/_warmer'
          path '/{index}/_warmer/{name}'
          path '/_warmer/{name}'
          path '/{index}/{type}/_warmer/{name}'

          part :index, type: String
          part :name, type: String
          part :type, type: String

          params do
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

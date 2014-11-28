# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/indices-warmers.html

module Eson
  module Shared
    module Indices
      module PutWarmer
        include Eson::API::DSL

        request_methods :put, :post

        url do
          set_base_path '/{index}/_warmer/{name}'
          path '/_warmer/{name}'
          path '/{index}/_warmer/{name}'
          path '/{index}/{type}/_warmer/{name}'
          path '/_warmers/{name}'
          path '/{index}/_warmers/{name}'
          path '/{index}/{type}/_warmers/{name}'

          part :index, type: String
          part :name, type: String, required: true
          part :type, type: String

          params do
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

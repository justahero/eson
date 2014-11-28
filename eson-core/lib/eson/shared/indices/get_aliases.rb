# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/indices-aliases.html

module Eson
  module Shared
    module Indices
      module GetAliases
        include Eson::API::DSL

        request_methods :get

        url do
          set_base_path '/_aliases'
          path '/_aliases'
          path '/{index}/_aliases'
          path '/{index}/_aliases/{name}'
          path '/_aliases/{name}'

          part :index, type: String
          part :name, type: String

          params do
            time :timeout
            boolean :local
          end
        end
      end
    end
  end
end

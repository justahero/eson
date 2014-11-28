# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/indices-aliases.html

module Eson
  module Shared
    module Indices
      module ExistsAlias
        include Eson::API::DSL

        request_methods :head

        url do
          set_base_path '/_alias/{name}'
          path '/_alias/{name}'
          path '/{index}/_alias/{name}'
          path '/{index}/_alias'

          part :index, type: String
          part :name, type: String

          params do
            boolean :ignore_unavailable
            boolean :allow_no_indices
            enum :expand_wildcards, ["open", "closed"], ["open", "closed"]
            boolean :local
          end
        end
      end
    end
  end
end

# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/indices-aliases.html

module Eson
  module Shared
    module Indices
      module DeleteAlias
        include Eson::API::DSL

        request_methods :delete

        url do
          set_base_path '/{index}/_alias/{name}'
          path '/{index}/_alias/{name}'
          path '/{index}/_aliases/{name}'

          part :index, type: String, required: true
          part :name, type: String, required: true

          params do
            time :timeout
            time :master_timeout
          end
        end
      end
    end
  end
end

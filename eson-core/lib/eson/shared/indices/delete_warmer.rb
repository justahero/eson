# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/indices-warmers.html

module Eson
  module Shared
    module Indices
      module DeleteWarmer
        include Eson::API::DSL

        request_methods :delete

        url do
          set_base_path '/{index}/_warmer/{name}'
          path '/{index}/_warmer/{name}'
          path '/{index}/_warmers/{name}'

          part :index, type: String, required: true
          part :name, type: String, required: true

          params do
            time :master_timeout
            list :name
          end
        end
      end
    end
  end
end

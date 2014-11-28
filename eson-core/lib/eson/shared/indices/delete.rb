# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/indices-delete-index.html

module Eson
  module Shared
    module Indices
      module Delete
        include Eson::API::DSL

        request_methods :delete

        url do
          set_base_path '/{index}'
          path '/{index}'

          part :index, type: String, required: true

          params do
            time :timeout
            time :master_timeout
          end
        end
      end
    end
  end
end

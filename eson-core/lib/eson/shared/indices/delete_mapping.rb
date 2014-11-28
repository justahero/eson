# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/indices-delete-mapping.html

module Eson
  module Shared
    module Indices
      module DeleteMapping
        include Eson::API::DSL

        request_methods :delete

        url do
          set_base_path '/{index}/{type}/_mapping'
          path '/{index}/{type}/_mapping'
          path '/{index}/{type}'
          path '/{index}/_mapping/{type}'
          path '/{index}/{type}/_mappings'
          path '/{index}/_mappings/{type}'

          part :index, type: String, required: true
          part :type, type: String, required: true

          params do
            time :master_timeout
          end
        end
      end
    end
  end
end

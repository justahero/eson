# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/docs-get.html

module Eson
  module Shared
    module Core
      module Exists
        include Eson::API::DSL

        request_methods :head

        url do
          set_base_path '/{index}/{type}/{id}'
          path '/{index}/{type}/{id}'

          part :id, type: String, required: true
          part :index, type: String, required: true
          part :type, type: String, required: true

          params do
            string :parent
            string :preference
            boolean :realtime
            boolean :refresh
            string :routing
          end
        end
      end
    end
  end
end

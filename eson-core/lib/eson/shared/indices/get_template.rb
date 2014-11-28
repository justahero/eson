# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/indices-templates.html

module Eson
  module Shared
    module Indices
      module GetTemplate
        include Eson::API::DSL

        request_methods :get

        url do
          set_base_path '/_template/{name}'
          path '/_template'
          path '/_template/{name}'

          part :name, type: String, required: false

          params do
            boolean :flat_settings
            boolean :local
          end
        end
      end
    end
  end
end

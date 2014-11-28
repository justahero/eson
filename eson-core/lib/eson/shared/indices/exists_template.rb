# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/indices-templates.html

module Eson
  module Shared
    module Indices
      module ExistsTemplate
        include Eson::API::DSL

        request_methods :head

        url do
          set_base_path '/_template/{name}'
          path '/_template/{name}'

          part :name, type: String, required: true

          params do
            boolean :local
          end
        end
      end
    end
  end
end

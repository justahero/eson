# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/indices-templates.html

module Eson
  module Shared
    module Indices
      module DeleteTemplate
        include Eson::API::DSL

        request_methods :delete

        url do
          set_base_path '/_template/{name}'
          path '/_template/{name}'

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

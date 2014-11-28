# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/search-template.html

module Eson
  module Shared
    module Core
      module DeleteTemplate
        include Eson::API::DSL

        request_methods :delete

        url do
          set_base_path '/_search/template/{id}'
          path '/_search/template/{id}'

          part :id, type: String

          params do
            number :version
            enum :version_type, ["internal", "external", "external_gte", "force"], nil
          end
        end
      end
    end
  end
end

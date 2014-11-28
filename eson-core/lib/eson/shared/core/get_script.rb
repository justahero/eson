# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/modules-scripting.html

module Eson
  module Shared
    module Core
      module GetScript
        include Eson::API::DSL

        request_methods :get

        url do
          set_base_path '/_scripts/{lang}/{id}'
          path '/_scripts/{lang}/{id}'

          part :id, type: String, required: true
          part :lang, type: String, required: true

          params do
            number :version
            enum :version_type, ["internal", "external", "external_gte", "force"], nil
          end
        end
      end
    end
  end
end

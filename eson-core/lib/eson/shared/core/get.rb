# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/docs-get.html

module Eson
  module Shared
    module Core
      module Get
        include Eson::API::DSL

        request_methods :get

        url do
          set_base_path '/{index}/{type}/{id}'
          path '/{index}/{type}/{id}'

          part :id, type: String, required: true
          part :index, type: String, required: true
          part :type, type: String, required: true

          params do
            list :fields
            string :parent
            string :preference
            boolean :realtime
            boolean :refresh
            string :routing
            list :_source
            list :_source_exclude
            list :_source_include
            number :version
            enum :version_type, ["internal", "external", "external_gte", "force"], nil
          end
        end
      end
    end
  end
end

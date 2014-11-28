# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/docs-delete.html

module Eson
  module Shared
    module Core
      module Delete
        include Eson::API::DSL

        request_methods :delete

        url do
          set_base_path '/{index}/{type}/{id}'
          path '/{index}/{type}/{id}'

          part :id, type: String, required: true
          part :index, type: String, required: true
          part :type, type: String, required: true

          params do
            enum :consistency, ["one", "quorum", "all"], nil
            string :parent
            boolean :refresh
            enum :replication, ["sync", "async"], "sync"
            string :routing
            time :timeout
            number :version
            enum :version_type, ["internal", "external", "external_gte", "force"], nil
          end
        end
      end
    end
  end
end

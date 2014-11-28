# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/docs-index_.html

module Eson
  module Shared
    module Core
      module Index
        include Eson::API::DSL

        request_methods :post, :put

        url do
          set_base_path '/{index}/{type}'
          path '/{index}/{type}'
          path '/{index}/{type}/{id}'

          part :id, type: String
          part :index, type: String, required: true
          part :type, type: String, required: true

          params do
            enum :consistency, ["one", "quorum", "all"], nil
            enum :op_type, ["index", "create"], "index"
            string :parent
            boolean :refresh
            enum :replication, ["sync", "async"], "sync"
            string :routing
            time :timeout
            time :timestamp
            duration :ttl
            number :version
            enum :version_type, ["internal", "external", "external_gte", "force"], nil
          end
        end
      end
    end
  end
end

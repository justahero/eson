# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/docs-update.html

module Eson
  module Shared
    module Core
      module Update
        include Eson::API::DSL

        request_methods :post

        url do
          set_base_path '/{index}/{type}/{id}/_update'
          path '/{index}/{type}/{id}/_update'

          part :id, type: String, required: true
          part :index, type: String, required: true
          part :type, type: String, required: true

          params do
            enum :consistency, ["one", "quorum", "all"], nil
            list :fields
            string :lang
            string :parent
            boolean :refresh
            enum :replication, ["sync", "async"], "sync"
            number :retry_on_conflict
            string :routing
            string :script
            string :script_id
            boolean :scripted_upsert
            time :timeout
            time :timestamp
            duration :ttl
            number :version
            enum :version_type, ["internal", "force"], nil
          end
        end
      end
    end
  end
end

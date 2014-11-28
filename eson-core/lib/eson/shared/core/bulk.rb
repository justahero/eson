# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/docs-bulk.html

module Eson
  module Shared
    module Core
      module Bulk
        include Eson::API::DSL

        request_methods :post, :put

        url do
          set_base_path '/_bulk'
          path '/_bulk'
          path '/{index}/_bulk'
          path '/{index}/{type}/_bulk'

          part :index, type: String
          part :type, type: String

          params do
            enum :consistency, ["one", "quorum", "all"], nil
            boolean :refresh
            enum :replication, ["sync", "async"], "sync"
            string :routing
            time :timeout
            string :type
          end
        end
      end
    end
  end
end

# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/docs-delete-by-query.html

module Eson
  module Shared
    module Core
      module DeleteByQuery
        include Eson::API::DSL

        request_methods :delete

        url do
          set_base_path '/{index}/_query'
          path '/{index}/_query'
          path '/{index}/{type}/_query'

          part :index, type: String, required: true
          part :type, type: String

          params do
            string :analyzer
            enum :consistency, ["one", "quorum", "all"], nil
            enum :default_operator, ["AND", "OR"], "OR"
            string :df
            boolean :ignore_unavailable
            boolean :allow_no_indices
            enum :expand_wildcards, ["open", "closed"], "open"
            enum :replication, ["sync", "async"], "sync"
            string :q
            string :routing
            string :source
            time :timeout
          end
        end
      end
    end
  end
end

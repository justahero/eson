# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/docs-multi-termvectors.html

module Eson
  module Shared
    module Core
      module Mtermvectors
        include Eson::API::DSL

        request_methods :get, :post

        url do
          set_base_path '/_mtermvectors'
          path '/_mtermvectors'
          path '/{index}/_mtermvectors'
          path '/{index}/{type}/_mtermvectors'

          part :index, type: String
          part :type, type: String
          part :id, type: String

          params do
            list :ids
            boolean :term_statistics
            boolean :field_statistics
            list :fields
            boolean :offsets
            boolean :positions
            boolean :payloads
            string :preference
            string :routing
            string :parent
            boolean :realtime
          end
        end
      end
    end
  end
end

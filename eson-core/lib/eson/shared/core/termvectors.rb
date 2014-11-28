# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/docs-termvectors.html

module Eson
  module Shared
    module Core
      module Termvectors
        include Eson::API::DSL

        request_methods :get, :post

        url do
          set_base_path '/{index}/{type}/{id}/_termvectors'
          path '/{index}/{type}/{id}/_termvectors'

          part :index, type: String, required: true
          part :type, type: String, required: true
          part :id, type: String, required: true

          params do
            boolean :term_statistics
            boolean :field_statistics
            boolean :dfs
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

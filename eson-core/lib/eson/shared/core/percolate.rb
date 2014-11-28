# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/search-percolate.html

module Eson
  module Shared
    module Core
      module Percolate
        include Eson::API::DSL

        request_methods :get, :post

        url do
          set_base_path '/{index}/{type}/_percolate'
          path '/{index}/{type}/_percolate'
          path '/{index}/{type}/{id}/_percolate'

          part :index, type: String, required: true
          part :type, type: String, required: true
          part :id, type: String, required: false

          params do
            list :routing
            string :preference
            boolean :ignore_unavailable
            boolean :allow_no_indices
            enum :expand_wildcards, ["open", "closed"], "open"
            string :percolate_index
            string :percolate_type
            string :percolate_routing
            string :percolate_preference
            enum :percolate_format, ["ids"], nil
            number :version
            enum :version_type, ["internal", "external", "external_gte", "force"], nil
          end
        end
      end
    end
  end
end

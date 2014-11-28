# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/indices-refresh.html

module Eson
  module Shared
    module Indices
      module Refresh
        include Eson::API::DSL

        request_methods :post, :get

        url do
          set_base_path '/_refresh'
          path '/_refresh'
          path '/{index}/_refresh'

          part :index, type: String

          params do
            boolean :ignore_unavailable
            boolean :allow_no_indices
            enum :expand_wildcards, ["open", "closed"], "open"
            boolean :force
            string :operation_threading
          end
        end
      end
    end
  end
end

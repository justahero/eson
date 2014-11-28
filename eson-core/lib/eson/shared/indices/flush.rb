# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/indices-flush.html

module Eson
  module Shared
    module Indices
      module Flush
        include Eson::API::DSL

        request_methods :post, :get

        url do
          set_base_path '/_flush'
          path '/_flush'
          path '/{index}/_flush'

          part :index, type: String

          params do
            boolean :force
            boolean :full
            boolean :wait_if_ongoing
            boolean :ignore_unavailable
            boolean :allow_no_indices
            enum :expand_wildcards, ["open", "closed"], "open"
          end
        end
      end
    end
  end
end

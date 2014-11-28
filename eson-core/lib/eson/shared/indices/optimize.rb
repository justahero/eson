# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/indices-optimize.html

module Eson
  module Shared
    module Indices
      module Optimize
        include Eson::API::DSL

        request_methods :post, :get

        url do
          set_base_path '/_optimize'
          path '/_optimize'
          path '/{index}/_optimize'

          part :index, type: String

          params do
            boolean :flush
            boolean :ignore_unavailable
            boolean :allow_no_indices
            enum :expand_wildcards, ["open", "closed"], "open"
            number :max_num_segments
            boolean :only_expunge_deletes
            string :operation_threading
            boolean :wait_for_merge
          end
        end
      end
    end
  end
end

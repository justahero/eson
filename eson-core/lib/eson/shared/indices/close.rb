# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/indices-open-close.html

module Eson
  module Shared
    module Indices
      module Close
        include Eson::API::DSL

        request_methods :post

        url do
          set_base_path '/{index}/_close'
          path '/{index}/_close'

          part :index, type: String, required: true

          params do
            time :timeout
            time :master_timeout
            boolean :ignore_unavailable
            boolean :allow_no_indices
            enum :expand_wildcards, ["open", "closed"], "open"
          end
        end
      end
    end
  end
end
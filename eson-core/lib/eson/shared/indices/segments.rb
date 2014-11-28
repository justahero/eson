# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/indices-segments.html

module Eson
  module Shared
    module Indices
      module Segments
        include Eson::API::DSL

        request_methods :get

        url do
          set_base_path '/_segments'
          path '/_segments'
          path '/{index}/_segments'

          part :index, type: String

          params do
            boolean :ignore_unavailable
            boolean :allow_no_indices
            enum :expand_wildcards, ["open", "closed"], "open"
            boolean :human
            string :operation_threading
          end
        end
      end
    end
  end
end

# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/indices-types-exists.html

module Eson
  module Shared
    module Indices
      module ExistsType
        include Eson::API::DSL

        request_methods :head

        url do
          set_base_path '/{index}/{type}'
          path '/{index}/{type}'

          part :index, type: String, required: true
          part :type, type: String, required: true

          params do
            boolean :ignore_unavailable
            boolean :allow_no_indices
            enum :expand_wildcards, ["open", "closed"], "open"
            boolean :local
          end
        end
      end
    end
  end
end

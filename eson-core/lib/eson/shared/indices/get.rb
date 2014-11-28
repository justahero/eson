# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/indices-get-index.html

module Eson
  module Shared
    module Indices
      module Get
        include Eson::API::DSL

        request_methods :get

        url do
          set_base_path '/{index}'
          path '/{index}'
          path '/{index}/{feature}'

          part :index, type: String, required: true
          part :feature, type: String

          params do
            boolean :local
            boolean :ignore_unavailable
            boolean :allow_no_indices
            list :expand_wildcards
          end
        end
      end
    end
  end
end

# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/indices-get-settings.html

module Eson
  module Shared
    module Indices
      module GetSettings
        include Eson::API::DSL

        request_methods :get

        url do
          set_base_path '/_settings'
          path '/_settings'
          path '/{index}/_settings'
          path '/{index}/_settings/{name}'
          path '/_settings/{name}'

          part :index, type: String
          part :name, type: String

          params do
            boolean :ignore_unavailable
            boolean :allow_no_indices
            enum :expand_wildcards, ["open", "closed"], ["open", "closed"]
            boolean :flat_settings
            boolean :local
          end
        end
      end
    end
  end
end

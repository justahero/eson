# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/indices-update-settings.html

module Eson
  module Shared
    module Indices
      module PutSettings
        include Eson::API::DSL

        request_methods :put

        url do
          set_base_path '/_settings'
          path '/_settings'
          path '/{index}/_settings'

          part :index, type: String

          params do
            time :master_timeout
            boolean :ignore_unavailable
            boolean :allow_no_indices
            enum :expand_wildcards, ["open", "closed"], "open"
            boolean :flat_settings
          end
        end
      end
    end
  end
end

# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/indices-upgrade.html

module Eson
  module Shared
    module Indices
      module GetUpgrade
        include Eson::API::DSL

        request_methods :get

        url do
          set_base_path '/_upgrade'
          path '/_upgrade'
          path '/{index}/_upgrade'

          part :index, type: String

          params do
            boolean :ignore_unavailable
            boolean :allow_no_indices
            enum :expand_wildcards, ["open", "closed"], "open"
            boolean :human
          end
        end
      end
    end
  end
end

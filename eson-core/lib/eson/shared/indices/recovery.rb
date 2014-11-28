# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/indices-recovery.html

module Eson
  module Shared
    module Indices
      module Recovery
        include Eson::API::DSL

        request_methods :get

        url do
          set_base_path '/_recovery'
          path '/_recovery'
          path '/{index}/_recovery'

          part :index, type: String

          params do
            boolean :detailed
            boolean :active_only
            boolean :human
          end
        end
      end
    end
  end
end

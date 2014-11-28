# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/modules-snapshots.html

module Eson
  module Shared
    module Snapshot
      module Get
        include Eson::API::DSL

        request_methods :get

        url do
          set_base_path '/_snapshot/{repository}/{snapshot}'
          path '/_snapshot/{repository}/{snapshot}'

          part :repository, type: String, required: true
          part :snapshot, type: String, required: true

          params do
            time :master_timeout
          end
        end
      end
    end
  end
end

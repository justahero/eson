# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/modules-snapshots.html

module Eson
  module Shared
    module Snapshot
      module Status
        include Eson::API::DSL

        request_methods :get

        url do
          set_base_path '/_snapshot/_status'
          path '/_snapshot/_status'
          path '/_snapshot/{repository}/_status'
          path '/_snapshot/{repository}/{snapshot}/_status'

          part :repository, type: String
          part :snapshot, type: String

          params do
            time :master_timeout
          end
        end
      end
    end
  end
end

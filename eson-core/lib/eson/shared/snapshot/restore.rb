# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/modules-snapshots.html

module Eson
  module Shared
    module Snapshot
      module Restore
        include Eson::API::DSL

        request_methods :post

        url do
          set_base_path '/_snapshot/{repository}/{snapshot}/_restore'
          path '/_snapshot/{repository}/{snapshot}/_restore'

          part :repository, type: String, required: true
          part :snapshot, type: String, required: true

          params do
            time :master_timeout
            boolean :wait_for_completion
          end
        end
      end
    end
  end
end

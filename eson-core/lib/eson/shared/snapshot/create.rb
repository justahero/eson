# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/modules-snapshots.html

module Eson
  module Shared
    module Snapshot
      module Create
        include Eson::API::DSL

        request_methods :put, :post

        url do
          set_base_path '/_snapshot/{repository}/{snapshot}'
          path '/_snapshot/{repository}/{snapshot}'
          path '/_snapshot/{repository}/{snapshot}/_create'

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

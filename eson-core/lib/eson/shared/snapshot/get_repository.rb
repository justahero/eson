# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/modules-snapshots.html

module Eson
  module Shared
    module Snapshot
      module GetRepository
        include Eson::API::DSL

        request_methods :get

        url do
          set_base_path '/_snapshot'
          path '/_snapshot'
          path '/_snapshot/{repository}'

          part :repository, type: String

          params do
            time :master_timeout
            boolean :local
          end
        end
      end
    end
  end
end

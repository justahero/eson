# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/modules-snapshots.html

module Eson
  module Shared
    module Snapshot
      module VerifyRepository
        include Eson::API::DSL

        request_methods :post

        url do
          set_base_path '/_snapshot/{repository}/_verify'
          path '/_snapshot/{repository}/_verify'

          part :repository, type: String, required: true

          params do
            time :master_timeout
            time :timeout
          end
        end
      end
    end
  end
end

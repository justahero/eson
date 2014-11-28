# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/cluster-pending.html

module Eson
  module Shared
    module Cluster
      module PendingTasks
        include Eson::API::DSL

        request_methods :get

        url do
          set_base_path '/_cluster/pending_tasks'
          path '/_cluster/pending_tasks'


          params do
            boolean :local
            time :master_timeout
          end
        end
      end
    end
  end
end

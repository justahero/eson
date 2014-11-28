# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/cluster-reroute.html

module Eson
  module Shared
    module Cluster
      module Reroute
        include Eson::API::DSL

        request_methods :post

        url do
          set_base_path '/_cluster/reroute'
          path '/_cluster/reroute'


          params do
            boolean :dry_run
            boolean :explain
            list :metric
            time :master_timeout
            time :timeout
          end
        end
      end
    end
  end
end

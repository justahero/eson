# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/cluster-reroute.html

module Eson
  module Shared
    module Cluster
      module Reroute
        url do
          params do
            string :commands
          end

          source_param :commands
        end
      end
    end
  end
end

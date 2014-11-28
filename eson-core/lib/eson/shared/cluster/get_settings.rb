# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/cluster-update-settings.html

module Eson
  module Shared
    module Cluster
      module GetSettings
        include Eson::API::DSL

        request_methods :get

        url do
          set_base_path '/_cluster/settings'
          path '/_cluster/settings'


          params do
            boolean :flat_settings
            time :master_timeout
            time :timeout
          end
        end
      end
    end
  end
end

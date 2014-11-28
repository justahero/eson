# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/cluster-update-settings.html

module Eson
  module Shared
    module Cluster
      module PutSettings
        include Eson::API::DSL

        request_methods :put

        url do
          set_base_path '/_cluster/settings'
          path '/_cluster/settings'


          params do
            boolean :flat_settings
          end
        end
      end
    end
  end
end

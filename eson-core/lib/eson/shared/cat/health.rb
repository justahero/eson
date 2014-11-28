# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/cat-health.html

module Eson
  module Shared
    module Cat
      module Health
        include Eson::API::DSL

        request_methods :get

        url do
          set_base_path '/_cat/health'
          path '/_cat/health'


          params do
            boolean :local
            time :master_timeout
            list :h
            boolean :help
            boolean :ts
            boolean :v
          end
        end
      end
    end
  end
end

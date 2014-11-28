# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/cat.html

module Eson
  module Shared
    module Cat
      module Help
        include Eson::API::DSL

        request_methods :get

        url do
          set_base_path '/_cat'
          path '/_cat'


          params do
            boolean :help
          end
        end
      end
    end
  end
end

# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/cat-master.html

module Eson
  module Shared
    module Cat
      module Master
        include Eson::API::DSL

        request_methods :get

        url do
          set_base_path '/_cat/master'
          path '/_cat/master'


          params do
            boolean :local
            time :master_timeout
            list :h
            boolean :help
            boolean :v
          end
        end
      end
    end
  end
end

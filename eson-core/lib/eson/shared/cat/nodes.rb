# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/cat-nodes.html

module Eson
  module Shared
    module Cat
      module Nodes
        include Eson::API::DSL

        request_methods :get

        url do
          set_base_path '/_cat/nodes'
          path '/_cat/nodes'


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

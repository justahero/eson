# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/cat-allocation.html

module Eson
  module Shared
    module Cat
      module Allocation
        include Eson::API::DSL

        request_methods :get

        url do
          set_base_path '/_cat/allocation'
          path '/_cat/allocation'
          path '/_cat/allocation/{node_id}'

          part :node_id, type: String

          params do
            enum :bytes, ["b", "k", "m", "g"], nil
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

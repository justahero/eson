# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/cat-indices.html

module Eson
  module Shared
    module Cat
      module Indices
        include Eson::API::DSL

        request_methods :get

        url do
          set_base_path '/_cat/indices'
          path '/_cat/indices'
          path '/_cat/indices/{index}'

          part :index, type: String

          params do
            enum :bytes, ["b", "k", "m", "g"], nil
            boolean :local
            time :master_timeout
            list :h
            boolean :help
            boolean :pri
            boolean :v
          end
        end
      end
    end
  end
end

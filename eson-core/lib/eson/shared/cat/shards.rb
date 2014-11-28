# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/cat-shards.html

module Eson
  module Shared
    module Cat
      module Shards
        include Eson::API::DSL

        request_methods :get

        url do
          set_base_path '/_cat/shards'
          path '/_cat/shards'
          path '/_cat/shards/{index}'

          part :index, type: String

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

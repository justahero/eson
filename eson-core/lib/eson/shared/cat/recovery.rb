# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/cat-recovery.html

module Eson
  module Shared
    module Cat
      module Recovery
        include Eson::API::DSL

        request_methods :get

        url do
          set_base_path '/_cat/recovery'
          path '/_cat/recovery'
          path '/_cat/recovery/{index}'

          part :index, type: String

          params do
            enum :bytes, ["b", "k", "m", "g"], nil
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

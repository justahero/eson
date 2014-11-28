# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/cat-fielddata.html

module Eson
  module Shared
    module Cat
      module Fielddata
        include Eson::API::DSL

        request_methods :get

        url do
          set_base_path '/_cat/fielddata'
          path '/_cat/fielddata'
          path '/_cat/fielddata/{fields}'

          part :fields, type: String

          params do
            enum :bytes, ["b", "k", "m", "g"], nil
            boolean :local
            time :master_timeout
            list :h
            boolean :help
            boolean :v
            list :fields
          end
        end
      end
    end
  end
end

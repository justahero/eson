# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/indices-aliases.html

module Eson
  module Shared
    module Indices
      module UpdateAliases
        include Eson::API::DSL

        request_methods :post

        url do
          set_base_path '/_aliases'
          path '/_aliases'


          params do
            time :timeout
            time :master_timeout
          end
        end
      end
    end
  end
end

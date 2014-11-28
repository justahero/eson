# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/search-request-scroll.html

module Eson
  module Shared
    module Core
      module Scroll
        include Eson::API::DSL

        request_methods :get, :post

        url do
          set_base_path '/_search/scroll'
          path '/_search/scroll'
          path '/_search/scroll/{scroll_id}'

          part :scroll_id, type: String

          params do
            duration :scroll
            string :scroll_id
          end
        end
      end
    end
  end
end

# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/search-request-scroll.html

module Eson
  module Shared
    module Core
      module ClearScroll
        include Eson::API::DSL

        request_methods :delete

        url do
          set_base_path '/_search/scroll/{scroll_id}'
          path '/_search/scroll/{scroll_id}'
          path '/_search/scroll'

          part :scroll_id, type: String

          
        end
      end
    end
  end
end

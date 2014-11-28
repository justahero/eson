# See documentation http://www.elasticsearch.org/guide/

module Eson
  module Shared
    module Core
      module Ping
        include Eson::API::DSL

        request_methods :head

        url do
          set_base_path '/'
          path '/'


          
        end
      end
    end
  end
end

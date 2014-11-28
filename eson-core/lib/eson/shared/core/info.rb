# See documentation http://www.elasticsearch.org/guide/

module Eson
  module Shared
    module Core
      module Info
        include Eson::API::DSL

        request_methods :get

        url do
          set_base_path '/'
          path '/'


          
        end
      end
    end
  end
end

# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/docs-multi-get.html

module Eson
  module Shared
    module Core
      module Mget
        include Eson::API::DSL

        request_methods :get, :post

        url do
          set_base_path '/_mget'
          path '/_mget'
          path '/{index}/_mget'
          path '/{index}/{type}/_mget'

          part :index, type: String
          part :type, type: String

          params do
            list :fields
            string :preference
            boolean :realtime
            boolean :refresh
            list :_source
            list :_source_exclude
            list :_source_include
          end
        end
      end
    end
  end
end

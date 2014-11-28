# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/search-benchmark.html

module Eson
  module Shared
    module Core
      module ListBenchmarks
        include Eson::API::DSL

        request_methods :get

        url do
          set_base_path '/_bench'
          path '/_bench'
          path '/{index}/_bench'
          path '/{index}/{type}/_bench'

          part :index, type: String
          part :type, type: String

          
        end
      end
    end
  end
end

# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/search-benchmark.html

module Eson
  module Shared
    module Core
      module AbortBenchmark
        include Eson::API::DSL

        request_methods :post

        url do
          set_base_path '/_bench/abort/{name}'
          path '/_bench/abort/{name}'

          part :name, type: String

          
        end
      end
    end
  end
end

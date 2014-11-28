# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/cat-thread-pool.html

module Eson
  module Shared
    module Cat
      module ThreadPool
        include Eson::API::DSL

        request_methods :get

        url do
          set_base_path '/_cat/thread_pool'
          path '/_cat/thread_pool'


          params do
            boolean :local
            time :master_timeout
            list :h
            boolean :help
            boolean :v
            boolean :full_id
          end
        end
      end
    end
  end
end

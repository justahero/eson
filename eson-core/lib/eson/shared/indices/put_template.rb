# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/indices-templates.html

module Eson
  module Shared
    module Indices
      module PutTemplate
        include Eson::API::DSL

        request_methods :put, :post

        url do
          set_base_path '/_template/{name}'
          path '/_template/{name}'

          part :name, type: String, required: true

          params do
            number :order
            boolean :create
            time :timeout
            time :master_timeout
            boolean :flat_settings
          end
        end
      end
    end
  end
end

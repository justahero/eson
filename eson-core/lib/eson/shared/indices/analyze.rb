# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/indices-analyze.html

module Eson
  module Shared
    module Indices
      module Analyze
        include Eson::API::DSL

        request_methods :get, :post

        url do
          set_base_path '/_analyze'
          path '/_analyze'
          path '/{index}/_analyze'

          part :index, type: String

          params do
            string :analyzer
            list :char_filters
            string :field
            list :filters
            string :index
            boolean :prefer_local
            string :text
            string :tokenizer
            enum :format, ["detailed", "text"], "detailed"
          end
        end
      end
    end
  end
end

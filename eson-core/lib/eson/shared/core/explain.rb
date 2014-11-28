# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/search-explain.html

module Eson
  module Shared
    module Core
      module Explain
        include Eson::API::DSL

        request_methods :get, :post

        url do
          set_base_path '/{index}/{type}/{id}/_explain'
          path '/{index}/{type}/{id}/_explain'

          part :id, type: String, required: true
          part :index, type: String, required: true
          part :type, type: String, required: true

          params do
            boolean :analyze_wildcard
            string :analyzer
            enum :default_operator, ["AND", "OR"], "OR"
            string :df
            list :fields
            boolean :lenient
            boolean :lowercase_expanded_terms
            string :parent
            string :preference
            string :q
            string :routing
            string :source
            list :_source
            list :_source_exclude
            list :_source_include
          end
        end
      end
    end
  end
end

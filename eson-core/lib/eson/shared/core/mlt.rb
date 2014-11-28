# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/search-more-like-this.html

module Eson
  module Shared
    module Core
      module Mlt
        include Eson::API::DSL

        request_methods :get, :post

        url do
          set_base_path '/{index}/{type}/{id}/_mlt'
          path '/{index}/{type}/{id}/_mlt'

          part :id, type: String, required: true
          part :index, type: String, required: true
          part :type, type: String, required: true

          params do
            number :boost_terms
            number :max_doc_freq
            number :max_query_terms
            number :max_word_length
            number :min_doc_freq
            number :min_term_freq
            number :min_word_length
            list :mlt_fields
            number :percent_terms_to_match
            string :routing
            number :search_from
            list :search_indices
            string :search_scroll
            number :search_size
            string :search_source
            string :search_type
            list :search_types
            list :stop_words
          end
        end
      end
    end
  end
end

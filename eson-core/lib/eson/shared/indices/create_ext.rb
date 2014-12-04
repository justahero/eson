# See documentation http://www.elasticsearch.org/guide/en/elasticsearch/reference/master/indices-create-index.html

module Eson
  module Shared
    module Indices
      module Create
        url do
          source_param :settings
        end
      end
    end
  end
end

module Eson
  module HTTP
    module Bulk
      include Shared::Bulk
      extend API
      
      request_method :put
      
      def path
        '/_bulk'
      end
      
      def source
        bulk.map {|r| serialize_request(r)}.join
      end
      
      def serialize_request(request)
        case request
        when Eson::HTTP::Index
          MultiJson.encode({ "index" => to_params_hash(request) }) << "\n" << request.source << "\n"
        when Eson::HTTP::Delete
          MultiJson.encode({ "delete" => to_params_hash(request) }) << "\n"
        else
          warn("Unserializable request #{request.inspect}")
        end
      end
      
      def to_params_hash(r)
        { "_index" => r.index, "_type" => r.type, "_id" => r.id }
      end
    end
  end
end
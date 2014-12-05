module Eson
  module HTTP
    module Core
      module Bulk
        include Eson::Shared::Core::Bulk

        PARTS_MAPPING = [:index, :type, :id].map do |part|
          [part, "_#{part}"]
        end
        FIELD_MAPPING = [:parent, :ttl, :timestamp, :routing].map do |field|
          [field, "_#{field}"]
        end

        def source
          bulk.map { |r| serialize_request(r) }.join
        end

        def serialize_request(request)
          case request
          when Eson::HTTP::Core::Index
            MultiJson.encode({ "index" => to_params_hash(request) }) << "\n" << request.source << "\n"
          when Eson::HTTP::Core::Delete
            MultiJson.encode({ "delete" => to_params_hash(request) }) << "\n"
          else
            warn("Unserializable request #{request.inspect}")
          end
        end

        def to_params_hash(r)
          params = {}
          PARTS_MAPPING.inject(params) do |params, (field, serialized_field)|
            if r.url.parts.respond_to?(field) && val = r.url.parts.send(field)
              params[serialized_field] = val
            end
            params
          end
          FIELD_MAPPING.inject(params) do |params, (field, serialized_field)|
            if r.url.params.respond_to?(field) && val = r.url.params.send(field)
              params[serialized_field] = val
            end
            params
          end
          params
        end
      end
    end
  end
end

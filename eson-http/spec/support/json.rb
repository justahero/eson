require 'json'
require 'json-schema'

module Eson
  module Support
    module Spec
      module JSON
        def json_response
          json_parse(last_response.body)
        end

        def valid_json?(text)
          json_parse(text)
          true
        rescue
          false
        end

        def json_parse(text)
          ::JSON.parse(text)
        end

        def validate_schema(schema_file, json)
          root = File.dirname(__FILE__)
          file = File.join(root, '../schema', "#{schema_file}.json")
          errors = ::JSON::Validator.fully_validate(file, json)
          return true if errors.empty?

          errors.each { |error| STDOUT.puts error }
          false
        end
      end
    end
  end
end

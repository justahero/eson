require 'json'

RSpec::Matchers.define :match_json_schema do |schema|
  match do |response|
    body = response.body
    validate_schema(schema, JSON.parse(body))
  end
end

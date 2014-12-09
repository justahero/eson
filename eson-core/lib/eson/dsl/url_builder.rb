require 'addressable/template'
require 'virtus'

require 'eson/dsl/param_builder'
require 'eson/dsl/part_builder'

module Eson
  module API
    module DSL
      class UrlBuilder
        include Virtus.model

        attribute :base_path, String, default: ''
        attribute :paths, Array[String], default: []
        attribute :parts, PartBuilder
        attribute :params, ParamBuilder
        attribute :source_params, Array[String], default: []

        def find_path
          paths.sort_by(&:size).reverse.each do |path|
            template = Addressable::Template.new(path)
            keys = template.keys.map(&:to_sym)

            expansions = {}
            keys.each do |k|
              expansions[k] = parts.send(k) if parts.is_set?(k)
            end

            if expansions.size == keys.size
              return template.expand(expansions).path
            end
          end
          base_path
        end

        def query_values
          params.attributes.reject { |k,v| v.nil? || source_params.include?(k.to_s) }
        end

        def source_values
          params.attributes.select { |k,v| !v.nil? && source_params.include?(k.to_s) }
        end
      end
    end
  end
end

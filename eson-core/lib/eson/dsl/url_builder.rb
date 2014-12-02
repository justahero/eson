require 'addressable/template'
require 'eson/dsl/param_builder'
require 'eson/dsl/part_builder'

module Eson
  module API
    module DSL
      class UrlBuilder
        attr_reader :base_path
        attr_reader :paths
        attr_reader :parts
        attr_reader :params
        attr_reader :source_params

        def initialize(&block)
          @params = ParamBuilder.new
          @parts  = PartBuilder.new
          @paths  = []
          @source_params = []
          instance_eval(&block) if block_given?
        end

        def set_base_path(path)
          @base_path = path
        end

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
          params.attributes.reject { |k,v| v.nil? || source_params.include?(k) }
        end

        def source_values
          params.attributes.select { |k,v| !v.nil? && source_params.include?(k) }
        end

        def path(path)
          @paths << path
        end

        def part(path, args = {})
          @parts.add_part(path, args)
          @parts
        end

        def params(&block)
          @params.instance_eval(&block) if block_given?
          @params
        end

        def source_param(*list)
          list.each do |param|
            @source_params << param.to_sym
            unless @params.respond_to?(param)
              @params.string(param)
            end
          end
        end
      end
    end
  end
end

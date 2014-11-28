require 'virtus'

module Eson
  module API
    module DSL
      class PartBuilder
        def initialize
          @required_parts ||= {}
        end

        def add_part(path, args = {})
          name = path.to_sym
          type = args.fetch(:type)

          @mod ||= Module.new do
            include Virtus.module
          end
          @mod.instance_eval do
            attribute name, type, default: ''
          end
          extend @mod

          @required_parts[name] = args.fetch(:required) { false }
        end

        def required
          names = (@attribute_set || []).map(&:name)
          required = @required_parts.select { |k, v| v }
          required.keys.select { |k| names.include?(k) }
        end

        def multi_index?
          if respond_to?(:index)
            @attribute_set[:index].primitive == Array
          else
            false
          end
        end
      end
    end
  end
end

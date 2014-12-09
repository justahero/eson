require 'virtus'

module Eson
  module API
    module DSL
      class PartBuilder
        include Virtus.model

        def initialize(args = {})
          super
          @mod = create_module
          @required_parts ||= {}
          args.each { |k, v| add_part(k, v) }
        end

        def add_part(path, args = {})
          name = path.to_sym
          type = args.fetch(:type)

          @mod.instance_eval do
            attribute name, type
          end
          @required_parts[name] = args.fetch(:required) { false }
        end

        def names
          (@attribute_set || []).map(&:name)
        end

        def required
          names = self.names
          required = @required_parts.select { |k, v| v }
          required.keys.select { |k| names.include?(k) }
        end

        def is_set?(name)
          respond_to?(name.to_sym) && !send(name.to_sym).nil?
        end

        def multi_index?
          if respond_to?(:index)
            @attribute_set[:index].primitive == Array
          else
            false
          end
        end

        private

        def create_module
          m = Module.new do
            include Virtus.module
          end
          self.extend m
        end
      end
    end
  end
end

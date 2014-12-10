require 'virtus'

module Eson
  module API
    module DSL
      class ParamBuilder
        include Virtus.model

        TYPE_MAP = {
          'string'   => String,
          'text'     => String,
          'boolean'  => Boolean,
          'number'   => Fixnum,
          'duration' => Integer,
          'list'     => Array[String],
          'time'     => String,
          'enum'     => String
        }

        def initialize(args = {})
          @mod = create_module
          add_params(args)
        end

        def add_params(args = {})
          args.each do |k, v|
            type = v.fetch(:type)
            send("#{type}", k, TYPE_MAP[type.to_s], v)
          end
        end

        [:string, :list, :boolean, :number, :duration, :time].each do |method_name|
          define_method method_name.to_sym do |name, type, args = {}|
            add_attribute name, type, args
          end
        end

        alias :text :string

        def enum(name, type, args = {})
          enum_values = args.fetch(:values)
          default = args.fetch(:default, nil)
          coercer = proc { |value|
            values = Array(value)
            unless values.all?{ |v| enum_values.include?(v) } || value.nil?
              raise ArgumentError, "Enum value #{value} not allowed"
            end
            value
          }
          add_attribute name, type, { default: default, coercer: coercer }
        end

        private

        def create_module
          m = Module.new do
            include Virtus.module
          end
          self.extend m
        end

        def add_attribute(name, type, args = {})
          @mod.instance_eval do
            attribute name.to_sym, type, args
          end
          send("#{name}=", args[:default]) unless args[:default].nil?
        end
      end
    end
  end
end

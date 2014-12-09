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
          super
          @mod = create_module
          add_params(args)
        end

        def add_params(args = {})
          args.each do |k, v|
            type = v.fetch(:type)
            if type == 'enum'
              enum(k, v)
            else
              send("#{type}", k, v[:default])
            end
          end
        end

        def enum(name, args = {})
          enum_values = args.fetch(:values)
          default = args.fetch(:default, nil)
          coercer = proc { |value|
            values = Array(value)
            unless values.all?{ |v| enum_values.include?(v) } || value.nil?
              raise ArgumentError
            end
            value
          }
          add_attribute name, String, default, coercer
        end

        def string(name, default = nil)
          add_attribute name, String, default
        end

        alias :text :string

        def list(name, default = nil)
          add_attribute name, Array[String], default
        end

        def boolean(name, default = nil)
          add_attribute name, 'Boolean', default
        end

        def number(name, default = nil)
          add_attribute name, Fixnum, default
        end

        def duration(name, default = nil)
          add_attribute name, Integer, default
        end

        def time(name, default = nil)
          add_attribute name, String, default
        end

        private

        def create_module
          m = Module.new do
            include Virtus.module
          end
          self.extend m
        end

        def add_attribute(name, type, default = nil, coercer = nil)
          args = {}
          args[:coercer] = coercer if coercer
          @mod.instance_eval do
            attribute name.to_sym, type, args
          end
          send("#{name}=", default)
        end
      end
    end
  end
end

module Eson
  module API
    module DSL
      class ParamsHash
        def initialize(&block)
          @params = {}
          instance_eval(&block) if block_given?
        end

        def has_key?(name)
          @params.has_key?(name.to_sym)
        end

        def string(name, default = nil)
          @params[name.to_sym] = { type: 'string', default: default }
        end

        alias :text :string

        def boolean(name, default = nil)
          @params[name.to_sym] = { type: 'boolean', default: default }
        end

        def number(name, default = nil)
          @params[name.to_sym] = { type: 'number', default: default }
        end

        def duration(name, default = nil)
          @params[name.to_sym] = { type: 'duration', default: default }
        end

        def time(name, default = nil)
          @params[name.to_sym] = { type: 'time', default: default }
        end

        def list(name, default = nil)
          @params[name.to_sym] = { type: 'list', default: default }
        end

        def enum(name, enum_values = [], default = nil)
          @params[name.to_sym] = { type: 'enum', values: enum_values, default: default }
        end

        def to_hash
          @params
        end
      end
    end
  end
end

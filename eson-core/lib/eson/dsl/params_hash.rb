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

        %w{string boolean number duration time list}.each do |method_name|
          define_method method_name.to_sym do |name, default = nil|
            @params[name.to_sym] = { type: "#{method_name}", default: default }
          end
        end

        alias :text :string

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

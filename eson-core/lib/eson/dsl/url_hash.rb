require 'eson/dsl/params_hash'

module Eson
  module API
    module DSL
      class UrlHash
        def initialize(&block)
          @base_path     = ''
          @paths         = []
          @params        = ParamsHash.new
          @source_params = []
          @parts         = {}
          instance_eval(&block) if block_given?
        end

        def set_base_path(path)
          @base_path = path
        end

        def part(path, args = {})
          @parts[path.to_sym] = args
        end

        def path(path)
          @paths << path
        end

        def params(&block)
          @params.instance_eval(&block) if block_given?
        end

        def source_param(*list)
          list.each do |param|
            @source_params << param.to_sym
            unless @params.has_key?(param)
              @params.string(param)
            end
          end
        end

        def to_hash
          {
            :paths         => @paths,
            :base_path     => @base_path,
            :params        => @params.to_hash,
            :source_params => @source_params,
            :parts         => @parts
          }
        end
      end
    end
  end
end

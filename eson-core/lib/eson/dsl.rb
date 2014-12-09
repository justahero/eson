require 'eson/dsl/url_builder'
require 'eson/dsl/url_hash'

module Eson
  module API
    module DSL
      module ClassMethods
        def url(&block)
          builder.instance_eval(&block)
        end

        def builder
          @builder ||= UrlHash.new
        end

        def request_methods(*list)
          define_method :request_methods do
            list.map { |e| e.to_sym }
          end
        end

        def included(base)
          b = builder
          base.send(:define_method, :url) do
            @url ||= UrlBuilder.new(b.to_hash.freeze)
          end
        end

        def extended(base)
          b = builder
          base.send(:define_singleton_method, :url) do
            @url ||= UrlBuilder.new(b.to_hash.freeze)
          end
        end
      end

      def self.included(base)
        base.instance_variable_set(:@url, Hash.new)
        base.extend(ClassMethods)
      end
    end
  end
end

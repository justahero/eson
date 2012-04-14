module Eson
  module Search
    class FuzzyLikeThis
      include Query

      # @macro eson.query
      short_name :flt

      attr_accessor :options

      def initialize(options = {})
        self.options = options
      end
    end
  end
end
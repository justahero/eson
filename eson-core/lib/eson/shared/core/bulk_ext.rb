module Eson
  module Shared
    module Core
      module Bulk
        url do
          params do
            list :bulk
          end

          source_param :bulk
        end

        def <<(request)
          bulk << request
        end

        def index(args, immediate = nil)
          self << client.index(args, false)
        end

        def delete(args, immediate = nil)
          self << client.delete(args, false)
        end

        def bulk
          @bulk ||= []
        end
      end
    end
  end
end

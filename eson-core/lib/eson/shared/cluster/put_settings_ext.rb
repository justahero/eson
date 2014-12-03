module Eson
  module Shared
    module Cluster
      module PutSettings
        url do
          params do
            time :timeout
            time :master_timeout
          end

          source_param :transient, :persistent
        end
      end
    end
  end
end

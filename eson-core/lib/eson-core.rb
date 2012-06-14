require 'multi_json'

require 'eson/client'
require 'eson/request'
require 'eson/chainable'
require 'eson/api'
require 'eson/error'

require 'eson/shared/core/index'
require 'eson/shared/core/get'
require 'eson/shared/core/delete'
require 'eson/shared/core/search'
require 'eson/shared/core/bulk'
require 'eson/shared/core/percolate'
require 'eson/shared/core/simple_search'
require 'eson/shared/core/more_like_this'
require 'eson/shared/core/update'
require 'eson/shared/core/msearch'
require 'eson/shared/core/mget'
require 'eson/shared/core/delete_by_query'

require 'eson/shared/cluster/health'
require 'eson/shared/cluster/state'
require 'eson/shared/cluster/nodes'
require 'eson/shared/cluster/stats'
require 'eson/shared/cluster/shutdown'

require 'eson/shared/indices/aliases'
require 'eson/shared/indices/analyze'
require 'eson/shared/indices/clear_cache'
require 'eson/shared/indices/close_index'
require 'eson/shared/indices/create_index'
require 'eson/shared/indices/delete_index'
require 'eson/shared/indices/delete_mapping'
require 'eson/shared/indices/flush'
require 'eson/shared/indices/get_mapping'
require 'eson/shared/indices/get_settings'
require 'eson/shared/indices/open_index'
require 'eson/shared/indices/optimize'
require 'eson/shared/indices/put_mapping'
require 'eson/shared/indices/refresh'
require 'eson/shared/indices/snapshot'
require 'eson/shared/indices/status'
require 'eson/shared/indices/put_template'
require 'eson/shared/indices/get_template'
require 'eson/shared/indices/delete_template'
require 'eson/shared/indices/update_settings'
require 'eson/shared/indices/exists'
require 'eson/shared/indices/stats'
require 'eson/shared/indices/segments'
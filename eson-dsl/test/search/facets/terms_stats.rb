{
  :query => {
    :match_all => {  }
  },
  :facets => {
    :tag_price_stats => {
      :terms_stats => {
        :key_field => :tag,
        :value_field => :price
      }
    }
  }
}
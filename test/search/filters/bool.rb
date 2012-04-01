{
  :query =>
  {
    :filtered => {
      :query => {:match_all => {}},
      :filter => {
        :bool => {
          :must => {
            :term => { "user" => "kimchy"}
          },
          :must_not => {
            :range => {
              :age => {
                :from => 10,
                :to => 20
              }
            }
          },
          :should => [
            { :term => { "tag" => "wow" } },
            { :term => { "tag" => "elasticsearch" } }
          ]
        }
      }
    }
  }
}
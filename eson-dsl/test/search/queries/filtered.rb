{:query => {:filtered => {:query => {:match_all => {}}, :filter => {:prefix => {"name.second" => "ba"}}}}}
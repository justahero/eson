require './test/test_config'

context "Filter" do
  context "#exists" do
    query_name "test/search/filters/exists"

    setup do
      q = Eson::Search::BaseQuery.new
      q.query do
        constant_score do
          filter do
            exists :field => "user"
          end
        end
      end
      q
    end
  end

  context "#missing" do
    query_name "test/search/filters/missing"

    setup do
      q = Eson::Search::BaseQuery.new
      q.query do
        constant_score do
          filter do
            missing :field => "user"
          end
        end
      end
      q
    end

  end

  context "#numeric_range" do
    query_name "test/search/filters/numeric_range"
    set :index, "foo"

    setup do
      q = Eson::Search::BaseQuery.new
      q.query do
        constant_score do
          filter do
            numeric_range :age, :from => 10, :to => 20
          end
        end
      end
      q
    end

  end

  context "#type" do
    query_name "test/search/filters/type"

    setup do
      q = Eson::Search::BaseQuery.new
      q.filter do
        type :my_type
      end
      q
    end
  end

  context '#range filter' do
    query_name "test/search/filters/range"

    setup do
      q = Eson::Search::BaseQuery.new
      q.filter do
        range :age, :from => 10, :to => 20
      end
      q
    end
  end

  context '#match_all with #ids filter' do
    query_name "test/search/filters/ids"

    setup do
      q = Eson::Search::BaseQuery.new
      q.query do
        match_all
      end
      q.filter do
        ids "user", [1,2,3,4,5,6,7]
      end
      q
    end

  end

  context "#bool filter" do
    query_name "test/search/filters/bool"

    setup do
      q = Eson::Search::BaseQuery.new
      q.query do
        match_all
      end

      q.filter do
        options = {:minimum_number_should_match => 1,
                   :boost => 1.0}

        bool do
          must do
            term "user" => "kimchy"
          end
          must_not do
            range :age, :from => 10, :to => 20
          end
          should do
            term "tag" => "wow"
            term "tag" => "elasticsearch"
          end
        end
      end
      q
    end
  end

  context "#has_child filter" do
    query_name "test/search/filters/has_child"
    set :type, "blog"

    setup do
      q = Eson::Search::BaseQuery.new
      q.filter do
        has_child :blog_tag do
          query do
            term :tag => "something"
          end
        end
      end
      q
    end
  end

  context "#and filter" do
    query_name "test/search/queries/and_filter"
    
    setup do
      q = Eson::Search::BaseQuery.new
      q.query do
        term :tag => "something"
      end
      q.filter do |f|
        f.and do #and is a keyword, so it needs a receiver
          range :post_date, {:from => "2010-03-01", :to => "2010-04-01"}
          prefix "name.second" => "ba"
        end
      end
      q
    end
    
  end
  
  context "#and filter using default" do
     query_name "test/search/queries/and_filter"

     setup do
       q = Eson::Search::BaseQuery.new
       q.query do
         term :tag => "something"
       end
       q.filter do |f|
         range :post_date, {:from => "2010-03-01", :to => "2010-04-01"}
         prefix "name.second" => "ba"
       end
       q
     end

   end
  
  context "#or filter" do
    query_name "test/search/queries/or_filter"
    
    setup do
      q = Eson::Search::BaseQuery.new
      q.query do
        term :tag => "something"
      end
      q.filter do |f|
        f.or do
          term "name.first" => "Felix"
          term "name.first" => "Florian"
        end
      end
      q
    end
  end
  
  context "#not filter" do
    query_name "test/search/queries/not_filter"
    
    setup do
      q = Eson::Search::BaseQuery.new
      q.query do
        term :tag => "something"
      end
      q.filter do |f|
        f.not do
          term "name.first" => "Florian"
        end
      end
      q
    end
  end

  context "#filter_query" do
    query_name "test/search/queries/filter_query"
    
    setup do
      q = Eson::Search::BaseQuery.new
      q.query do
        constant_score do
          filter do
            fquery :_cache => true do
              query_string "this AND that OR thus"
            end
          end
        end
      end
      q
    end
  end

  context "#geo_bounding_box filter" do
    query_name "test/search/filters/geo_bounding_box_hash"
    set :index, "geo"
    set :type, "pin"

    setup do
      q = Eson::Search::BaseQuery.new
      q.filter do
        geo_bounding_box "location" do
          top_left :lat => 40.73, :lon => -74.1
          bottom_right :lat => 40.717, :lon => -73.99
        end
      end
      q
    end
  end

  context "#geo_distance filter" do
    query_name "test/search/filters/geo_distance_hash"
    set :index, "geo"
    set :type, "pin"

    setup do
      q = Eson::Search::BaseQuery.new
      q.filter do
        geo_distance "location", :distance => "200km" do
          lat(40)
          lon(-70)
        end
      end
      q
    end
  end

  context "#geo_distance filter with block options" do
    query_name "test/search/filters/geo_distance_hash"
    set :index, "geo"
    set :type, "pin"

    setup do
      q = Eson::Search::BaseQuery.new
      q.filter do
        geo_distance "location" do
          distance "200km"
          lat(40)
          lon(-70)
        end
      end
      q
    end
  end
  
  context "#geo_distance_range filter" do
    query_name "test/search/filters/geo_distance_range_hash"
    set :index, "geo"
    set :type, "pin"

    setup do
      q = Eson::Search::BaseQuery.new
      q.filter do
        geo_distance_range "location" do
          from "200km"
          to "400km"
          lat(40)
          lon(-70)
        end
      end
      q
    end
  end

  context "#geo_polygon filter" do
    query_name "test/search/filters/geo_polygon_hash"
    set :index, "geo"
    set :type, "pin"

    setup do
      q = Eson::Search::BaseQuery.new
      q.filter do
        geo_polygon :location do
          points [{:lat => 40, :lon => -70},
                  {:lat => 30, :lon => -80}]

          point :lat => 20, :lon => -90
        end
      end
      q
    end
  end
end
  
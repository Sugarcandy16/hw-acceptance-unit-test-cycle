class Movie < ActiveRecord::Base
   # def director dir
    #    return Movie.where(director: dir)
    #end
    
    def self.with_same_dir(dir)
        Movie.where(director: dir)
    end
    
    def self.all_ratings
      return Movie.pluck('distinct(rating)')
  end
    
  def self.with_ratings(ratings_list)
      if ratings_list == []
          return Movie.all
      else
          return Movie.where(rating: ratings_list)
      end
  end
end

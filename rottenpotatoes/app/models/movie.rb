class Movie < ActiveRecord::Base
   # def director dir
    #    return Movie.where(director: dir)
    #end
    
    def self.with_same_dir(dir)
        Movie.where(director: dir)
    end
end

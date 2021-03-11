class Movie < ActiveRecord::Base
   # def director dir
    #    return Movie.where(director: dir)
    #end
    
    def with_dir(dir)
        Movie.where(director: dir)
    end
end

class MoviesController < ApplicationController

  def show
    id = params[:id] # retrieve movie ID from URI route
    @movie = Movie.find(id) # look up movie by unique ID
    # will render app/views/movies/show.<extension> by default
  end

  def index
    #@movies = Movie.all
    @sort = params[:sort] || session[:sort]
    session[:sort] = @sort
    @all_ratings= Movie.all_ratings
    @ratings_to_show = params[:ratings] || session[:ratings] || Hash.new
    session[:ratings]= @ratings_to_show
    
    @movies = Movie.with_ratings(@ratings_to_show.keys).order(@sort)
  end
  
  def same_director
    dir = Movie.find(params[:id]).director
    @movie1 = Movie.find(params[:id])
    if dir =~ /^[A-Z]/i
      @movies = Movie.with_same_dir(dir)
    else
      flash[:notice] = "'#{@movie1.title}' has no director info"
      redirect_to movies_path
    end
  end

  def new
    # default: render 'new' template
  end

  def create
    @movie = Movie.create!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully created."
    redirect_to movies_path
  end

  def edit
    @movie = Movie.find params[:id]
  end

  def update
    @movie = Movie.find params[:id]
    @movie.update_attributes!(movie_params)
    flash[:notice] = "#{@movie.title} was successfully updated."
    redirect_to movie_path(@movie)
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end

  private
  # Making "internal" methods private is not required, but is a common practice.
  # This helps make clear which methods respond to requests, and which ones do not.
  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date, :director)
  end
end

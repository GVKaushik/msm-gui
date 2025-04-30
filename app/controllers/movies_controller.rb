class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def add_movie
    new_movie = Movie.new
    new_movie.description = params.fetch("description_entry") 
    new_movie.year = params.fetch("year_entry")
    new_movie.duration = params.fetch("duration_entry")
    new_movie.image = params.fetch("image_entry")
    new_movie.title = params.fetch("title_entry")
    new_movie.director_id = params.fetch("director_id_entry")
    new_movie.save
    redirect_to("/movies")

  end
end

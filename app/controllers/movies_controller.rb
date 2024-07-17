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

  def create
    @movie_title = params.fetch("title")
    @movie_year = params.fetch("year")
    @movie_duration = params.fetch("duration")
    @movie_description = params.fetch("description")
    @movie_image = params.fetch("image")
    @movie_director_id = params.fetch("director_id")

    x = Movie.new
    x.title = @movie_title
    x.year = @movie_year
    x.duration = @movie_duration
    x.description = @movie_description
    x.image = @movie_image
    x.director_id = @movie_director_id
    x.save
    
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end
end

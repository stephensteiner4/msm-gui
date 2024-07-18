class DirectorsController < ApplicationController
  def index
    matching_directors = Director.all
    @list_of_directors = matching_directors.order({ :created_at => :desc })

    render({ :template => "director_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_directors = Director.where({ :id => the_id })
    @the_director = matching_directors.at(0)

    render({ :template => "director_templates/show" })
  end

  def max_dob
    directors_by_dob_desc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :desc })

    @youngest = directors_by_dob_desc.at(0)

    render({ :template => "director_templates/youngest" })
  end

  def min_dob
    directors_by_dob_asc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :asc })
      
    @eldest = directors_by_dob_asc.at(0)

    render({ :template => "director_templates/eldest" })
  end
  def create
    @director_name = params.fetch("name")
    @director_dob = params.fetch("dob")
    @director_bio = params.fetch("bio")
    @director_image = params.fetch("image")

    x = Director.new
    x.name = @director_name
    x.dob = @director_dob
    x.bio = @director_bio
    x.image = @director_image
    x.save
    
    matching_directors = Director.all
    @list_of_directors = matching_directors.order({ :created_at => :desc })

    render({ :template => "director_templates/index" })
  end

  def destroy
    @destroy_id = params.fetch("path_id")

    director_id = Director.where({ :id => @destroy_id }).at(0)

    director_id.destroy

    redirect_to("/directors")
  end

  def modify
    @modify_id = params.fetch("path_id")
    @modify_name = params.fetch("name")
    @modify_dob = params.fetch("dob")
    @modify_bio = params.fetch("bio")
    @modify_image = params.fetch("image")

    director_id = Director.where({ :id => @modify_id}).at(0)

    director_id.name = @modify_name
    director_id.dob = @modify_dob
    director_id.bio = @modify_bio
    director_id.image = @modify_image

    director_id.save

    redirect_to("/directors/#{@modify_id}")
  end
end

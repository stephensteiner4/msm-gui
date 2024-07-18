class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end

  def create
    @actor_name = params.fetch("name")
    @actor_dob = params.fetch("dob")
    @actor_bio = params.fetch("bio")
    @actor_image = params.fetch("image")

    x = Actor.new
    x.name = @actor_name
    x.dob = @actor_dob
    x.bio = @actor_bio
    x.image = @actor_image
    x.save
    
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def destroy
    @destroy_id = params.fetch("path_id")

    actor_id = Actor.where({ :id => @destroy_id }).at(0)

    actor_id.destroy

    redirect_to("/actors")
  end
end

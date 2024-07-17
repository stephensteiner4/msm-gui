task(:create_actor => :environment) do
  x = Actor.new
  x.name = params.fetch("name")
  x.dob = params.fetch("dob")
  x.bio = params.fetch("bio")
  x.image = params.fetch("image")
  x.save
end

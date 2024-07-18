Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })

  get("/directors", { :controller => "directors", :action => "index" })
  get("/directors/:path_id", { :controller => "directors", :action => "show" })
  post("/directors", { :controller => "directors", :action => "create"})
  get("/delete_director/:path_id", { :controller => "directors", :action => "destroy" })
  post("/directors/:path_id/modify", { :controller => "directors", :action => "modify" })

  get("/movies", { :controller => "movies", :action => "index" })
  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  post("/movies", { :controller => "movies", :action => "create"})
  get("/delete_movie/:path_id", { :controller => "movies", :action => "destroy" })
  post("/movies/:path_id/modify", { :controller => "movies", :action => "modify" })

  
  get("/actors", { :controller => "actors", :action => "index" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })
  post("/actors", { :controller => "actors", :action => "create" })
  get("/delete_actor/:path_id", { :controller => "actors", :action => "destroy" })
  post("/actors/:path_id/modify", { :controller => "actors", :action => "modify" })
end

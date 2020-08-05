Rails.application.routes.draw do
  get("/", { :controller => "application", :action => "homepage" })

  # Directors routes 
  get("/directors", { :controller => "directors", :action => "index" })
  
  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })
  
  get("/directors/:path_id", { :controller => "directors", :action => "show" })
  # new 
  get("/delete_director/:path_id", { :controller => "directors", :action => "destroy" })

  get("/insert_director", { :controller => "directors", :action => "create" })

  get("/modify_director/:path_id", { :controller => "directors", :action => "update" })

  # Movies routes
  get("/movies", { :controller => "movies", :action => "index" })

  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  
  #  new
  get("/delete_movie/:path_id", { :controller => "movies", :action => "destroy" })

  get("/insert_movie", { :controller => "movies", :action => "create" })

  get("/modify_movie/:path_id", { :controller => "movies", :action => "update" })
  # Actor routes
  
  get("/actors", { :controller => "actors", :action => "index" })
  
  get("/actors/:path_id", { :controller => "actors", :action => "show" })
  # new
  get("/insert_actor", { :controller => "actors", :action => "create" })
  
  get("/modify_actor/:path_id", { :controller => "actors", :action => "update" })
  
  get("/delete_actor/:path_id", { :controller => "actors", :action => "destroy" })
  
  # Character routes
  get("/insert_character", { :controller => "characters", :action => "create" })

end

class CharactersController < ApplicationController
  def create
    
    the_character = Character.new
    the_character.movie_id = params.fetch("query_movie_id")
    the_character.actor_id = params.fetch("query_actor_id")
    the_character.name = params.fetch("query_name")

    the_character.save

    redirect_to("/movies/#{the_character.movie_id}")
  end
end

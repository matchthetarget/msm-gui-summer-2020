require "rails_helper"

describe "/movies/[MOVIE ID]" do
  it "has form to edit/update movie record", points: 1 do
    
    carole_danvers = Director.new
    carole_danvers.name = "Carole Danvers"
    carole_danvers.bio = "..."
    carole_danvers.dob = "1976-03-14"
    carole_danvers.image = "image.jpg"
    carole_danvers.save

    the_turgle = Movie.new
    the_turgle.title = "The Turgle"
    the_turgle.duration = 120
    the_turgle.description = "Prepare to get turgled."
    the_turgle.year = 2022
    the_turgle.image = "turgle.png"
    the_turgle.director_id = carole_danvers.id
    the_turgle.save

    visit "/movies/#{the_turgle.id}"

    expect(page).to have_tag("form", :min => 1),
      "Expect '/movies/[MOVIE ID]' page to have minimum of one <form> tag, but couldn't find one."
  end
end

describe "/movies/[MOVIE ID]" do
  it "has Movie title prepopulated in an input element", :points => 1, hint: h("value_attribute") do
    director = Director.new
    director.name = "Beets Witherspoon"
    director.bio = "..."
    director.dob = "1976-04-13"
    director.image = "image.jpg"
    director.save

    movie = Movie.new
    movie.title = "The 22nd Pilot"
    movie.duration = 120
    movie.description = "Prepare to get turgled."
    movie.year = 2022
    movie.image = "pilot.png"
    movie.director_id = director.id
    movie.save

    visit "/movies/#{movie.id}"

    expect(page).to have_css("input[value='The 22nd Pilot']")
  end
end

describe "/movies/[MOVIE ID]" do
  it "has Movie year prepopulated in an input element", :points => 1, hint: h("value_attribute") do
    director = Director.new
    director.name = "Beets Witherspoon"
    director.bio = "..."
    director.dob = "1976-04-13"
    director.image = "image.jpg"
    director.save

    movie = Movie.new
    movie.title = "The 22nd Pilot"
    movie.duration = 120
    movie.description = "Prepare to get turgled."
    movie.year = 2022
    movie.image = "pilot.png"
    movie.director_id = director.id
    movie.save

    visit "/movies/#{movie.id}"

    expect(page).to have_css("input[value='2022']")
  end
end

describe "/movies/[MOVIE ID]" do
  it "has Movie image prepopulated in an input element", :points => 1, hint: h("value_attribute") do
    director = Director.new
    director.name = "Beets Witherspoon"
    director.bio = "..."
    director.dob = "1976-04-13"
    director.image = "image.jpg"
    director.save

    movie = Movie.new
    movie.title = "The 22nd Pilot"
    movie.duration = 120
    movie.description = "Prepare to get turgled."
    movie.year = 2022
    movie.image = "pilot.png"
    movie.director_id = director.id
    movie.save

    visit "/movies/#{movie.id}"

    expect(page).to have_css("input[value='pilot.png']")
  end
end

describe "/movies/[MOVIE ID]" do
  it "has Movie duration prepopulated in an input element", :points => 1, hint: h("value_attribute") do
    director = Director.new
    director.name = "Beets Witherspoon"
    director.bio = "..."
    director.dob = "1976-04-13"
    director.image = "image.jpg"
    director.save

    movie = Movie.new
    movie.title = "The 22nd Pilot"
    movie.duration = 120
    movie.description = "Prepare to get turgled."
    movie.year = 2022
    movie.image = "pilot.png"
    movie.director_id = director.id
    movie.save

    visit "/movies/#{movie.id}"

    expect(page).to have_css("input[value='120']")
  end
end

describe "/movies/[MOVIE ID]" do
  it "has Movie director_id prepopulated in an input element", :points => 1, hint: h("value_attribute") do
    director = Director.new
    director.name = "Beets Witherspoon"
    director.bio = "..."
    director.dob = "1976-04-13"
    director.image = "image.jpg"
    director.save

    movie = Movie.new
    movie.title = "The 22nd Pilot"
    movie.duration = 120
    movie.description = "Prepare to get turgled."
    movie.year = 2022
    movie.image = "pilot.png"
    movie.director_id = director.id
    movie.save

    visit "/movies/#{movie.id}"

    expect(page).to have_css("input[value='#{director.id}']")
  end
end

describe "/movies/[MOVIE ID]" do
  it "has Movie description prepopulated in a textarea element", :points => 1 do
    director = Director.new
    director.name = "Beets Witherspoon"
    director.bio = "..."
    director.dob = "1976-04-13"
    director.image = "image.jpg"
    director.save

    movie = Movie.new
    movie.title = "The 22nd Pilot"
    movie.duration = 120
    movie.description = "Prepare to get turgled."
    movie.year = 2022
    movie.image = "pilot.png"
    movie.director_id = director.id
    movie.save

    visit "/movies/#{movie.id}"

    first_textarea = find("textarea")
    expect(first_textarea.value).to match(/Prepare to get turgled/)
  end
end

describe "/movies/[MOVIE ID]" do
  it "has a form that updates an existing movie record.", :points => 1 do
    
    director = Director.new
    director.name = "Guy Fieri"
    director.dob = "1970-05-18"
    director.bio = "Just a guy"
    director.image = "chicken.png"
    director.save

    new_director = Director.new
    new_director.name = "Shame Johnson"
    new_director.dob = "1980-05-18"
    new_director.bio = "Shameful"
    new_director.image = "shame.png"
    new_director.save

    movie = Movie.new
    movie.title = "Food Origins"
    movie.duration = 120
    movie.description = "Welcome to flavor town."
    movie.year = 2022
    movie.image = "flavor.png"
    movie.director_id = director.id
    movie.save

    visit "/movies/#{movie.id}"
    
    fill_in "Title", with: "Sonic Adventure"
    fill_in "Year", with: "2034"
    fill_in "Description", with: "desc"
    fill_in "Duration", with: "99"
    fill_in "Image", with: "japan.jpg"
    fill_in "Director", with: new_director.id

    click_on "Update movie"

    updated_movie = Movie.where({ :id => movie.id }).at(0)

    expect(updated_movie.title).to eq("Sonic Adventure"),
      "Expected movie title to update when the form submitted but didn't."
    expect(updated_movie.year).to eq(2034),
      "Expected movie year to update when the form submitted but didn't."
    expect(updated_movie.description).to eq("desc"),
      "Expected movie description to update when the form submitted but didn't."
    expect(updated_movie.duration).to eq(99),
      "Expected movie duration to update when the form submitted but didn't."
    expect(updated_movie.image).to eq("japan.jpg"),
      "Expected movie image to update when the form submitted but didn't."
    expect(updated_movie.director_id).to eq(new_director.id),
      "Expected movie director_id to update when the form submitted but didn't."


  end
end


describe "/movies/[MOVIE ID]" do
  it "has a link with text 'Delete movie'", :points => 1 do
    director = Director.new
    director.name = "Beets Witherspoon"
    director.bio = "..."
    director.dob = "1976-04-13"
    director.image = "image.jpg"
    director.save

    movie = Movie.new
    movie.title = "The 22nd Pilot"
    movie.duration = 120
    movie.description = "Prepare to get turgled."
    movie.year = 2022
    movie.image = "pilot.png"
    movie.director_id = director.id
    movie.save

    old_movies_count = Movie.all.count

    visit "/movies/#{movie.id}"

    expect(page).to have_tag("a", :text => /Delete movie/i)
  end
end

describe "/movies/[MOVIE ID]" do
  it "has a 'Delete movie' link that removes the movie record from the database", :points => 1 do
    director = Director.new
    director.name = "Beets Witherspoon"
    director.bio = "..."
    director.dob = "1976-04-13"
    director.image = "image.jpg"
    director.save

    movie = Movie.new
    movie.title = "The 22nd Pilot"
    movie.duration = 120
    movie.description = "Prepare to get turgled."
    movie.year = 2022
    movie.image = "pilot.png"
    movie.director_id = director.id
    movie.save

    old_movies_count = Movie.all.count

    visit "/movies/#{movie.id}"

    find("a", :text => /Delete movie/i ).click

    expect(old_movies_count). to be > Movie.all.count
  end
end

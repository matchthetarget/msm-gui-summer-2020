require "rails_helper"

describe "/actors/[ACTOR ID]" do
  it "has form to  edit/update actor record", points: 1 do
    
    john_boyega = Actor.new
    john_boyega.name = "John Boyega"
    john_boyega.bio = "..."
    john_boyega.dob = "1986-03-14"
    john_boyega.image = "meme.jpg"
    john_boyega.save

    visit "/actors/#{john_boyega.id}"

    expect(page).to have_tag("form", :min => 1),
      "Expect '/actors/[ACTOR ID]' page to have minimum of one <form> tag, but couldn't find one."
  end
end

describe "/actors/[ACTOR ID]" do
  it "has Actor name prepopulated in an input element", :points => 1, hint: h("value_attribute") do
    actor = Actor.new
    actor.name = "Beets Witherspoon"
    actor.bio = "..."
    actor.dob = "1976-04-13"
    actor.image = "image.jpg"
    actor.save

    visit "/actors/#{actor.id}"

    expect(page).to have_css("input[value='Beets Witherspoon']")
  end
end

describe "/actors/[ACTOR ID]" do
  it "has Actor dob prepopulated in an input element", :points => 1, hint: h("value_attribute") do
    actor = Actor.new
    actor.name = "Beets Witherspoon"
    actor.bio = "..."
    actor.dob = "1976-04-13"
    actor.image = "image.jpg"
    actor.save

    visit "/actors/#{actor.id}"

    expect(page).to have_css("input[value='1976-04-13']")
  end
end

describe "/actors/[ACTOR ID]" do
  it "has Actor image prepopulated in an input element", :points => 1, hint: h("value_attribute") do
    actor = Actor.new
    actor.name = "Beets Witherspoon"
    actor.bio = "..."
    actor.dob = "1976-04-13"
    actor.image = "actor-image.jpg"
    actor.save

    visit "/actors/#{actor.id}"

    expect(page).to have_css("input[value='actor-image.jpg']")
  end
end

describe "/actors/[ACTOR ID]" do
  it "has Actor bio prepopulated in a textarea element", :points => 1 do
    actor = Actor.new
    actor.name = "Beets Witherspoon"
    actor.bio = "the person really loves film"
    actor.dob = "1976-04-13"
    actor.image = "image.jpg"
    actor.save

    visit "/actors/#{actor.id}"

    first_textarea = find("textarea")
    expect(first_textarea.value).to match(/the person really loves film/),
      "Couldn't find 'the person really loves film' in the textarea. Hint: Textareas don't use the value attribute like inputs. Try adding the content in-between the opening and closing tag."
  end
end

describe "/actors/[ACTOR ID]" do
  it "has a form that updates an existing actor record.", :points => 1 do
    
    actor = Actor.new
    actor.name = "Guy Fieri"
    actor.dob = "1970-05-18"
    actor.bio = "Just a guy"
    actor.image = "chicken.png"
    actor.save

    visit "/actors/#{actor.id}"
    
    fill_in "Name", with: "Sasha Braus"
    fill_in "DOB", with: "2034-12-13"
    fill_in "Bio", with: "holy cow"
    fill_in "Image", with: "profile.jpg"

    click_on "Update actor"

    updated_actor = Actor.where({ :id => actor.id }).at(0)

    expect(updated_actor.name).to eq("Sasha Braus"),
      "Expected actor name to update when the form submitted but didn't."
    expect(updated_actor.dob.to_s).to eq("2034-12-13"),
      "Expected actor dob to update when the form submitted but didn't."
    expect(updated_actor.bio).to eq("holy cow"),
      "Expected actor bio to update when the form submitted but didn't."
    expect(updated_actor.image).to eq("profile.jpg"),
      "Expected actor image to update when the form submitted but didn't."


  end
end


describe "/actors/[ACTOR ID]" do
  it "has a link with text 'Delete actor'", :points => 1 do
    actor = Actor.new
    actor.name = "Camera Ferara"
    actor.bio = "..."
    actor.dob = "1996-04-13"
    actor.image = "image.jpg"
    actor.save

    visit "/actors/#{actor.id}"

    expect(page).to have_tag("a", :text => /Delete actor/i)
  end
end

describe "/actors/[ACTOR ID]" do
  it "has a 'Delete actor' link that removes the actor record from the database", :points => 1 do
    actor = Actor.new
    actor.name = "Beets Withoutherspoon"
    actor.bio = "..."
    actor.dob = "1976-04-13"
    actor.image = "image.jpg"
    actor.save

    old_actors_count = Actor.all.count

    visit "/actors/#{actor.id}"

    find("a", :text => /Delete actor/i ).click

    expect(old_actors_count). to be > Actor.all.count
  end
end

describe "/actors/[ACTOR ID]" do
  it "has at least two forms to update an actor record and create a character record", points: 1 do
    
    john_boyega = Actor.new
    john_boyega.name = "John Boyega"
    john_boyega.bio = "..."
    john_boyega.dob = "1986-03-14"
    john_boyega.image = "meme.jpg"
    john_boyega.save

    visit "/actors/#{john_boyega.id}"

    expect(page).to have_tag("form", :min => 2),
      "Expect '/actors/[ACTOR ID]' page to have minimum of two <form> tags, but couldn't find two."
  end
end


describe "/actors/[ACTOR ID]" do
  it "has a <label> with the text 'Character'", points: 1 do
    john_boyega = Actor.new
    john_boyega.name = "John Boyega"
    john_boyega.bio = "..."
    john_boyega.dob = "1986-03-14"
    john_boyega.image = "meme.jpg"
    john_boyega.save

    visit "/actors/#{john_boyega.id}"

    expect(page).to have_tag("label", :text => /Character/i, :count => 1),
      "Expected page to have exactly 1 <label> tag with text 'Character', but didn't find one."
  end
end

describe "/actors/[ACTOR ID]" do
  it "has a label 'Character' with a matching input tag.", :points => 1 do
    
    john_boyega = Actor.new
    john_boyega.name = "John Boyega"
    john_boyega.bio = "..."
    john_boyega.dob = "1986-03-14"
    john_boyega.image = "meme.jpg"
    john_boyega.save

    visit "/actors/#{john_boyega.id}"
    
    name_label = find("label", :text => /Character/i)
    for_attribute = name_label[:for]
    
    if for_attribute.nil?
      expect(for_attribute).to_not be_empty,
        "Expected label's for attribute to be set to a non empty value, was '#{for_attribute}' instead."
    else
      all_inputs = all("input")
  
      all_input_ids = all_inputs.map { |input| input[:id] }
  
      expect(all_input_ids.count(for_attribute)).to eq(1),
        "Expected label's for attribute(#{for_attribute}) to match only 1 of the ids of an <input> tag (#{all_input_ids}), but found 0 or more than 1."  
    end

  end
end

describe "/actors/[ACTOR ID]" do
  it "has a <label> with the text 'Movie'", points: 1 do
    
    john_boyega = Actor.new
    john_boyega.name = "John Boyega"
    john_boyega.bio = "..."
    john_boyega.dob = "1986-03-14"
    john_boyega.image = "meme.jpg"
    john_boyega.save

    visit "/actors/#{john_boyega.id}"

    expect(page).to have_tag("label", :text => /Movie/i, :count => 1),
      "Expected page to have exactly 1 <label> tag with text 'Movie', but didn't find one."
  end
end


describe "/actors/[ACTOR ID]" do
  it "has a label 'Movie' with a matching input tag.", :points => 1 do
    
    john_boyega = Actor.new
    john_boyega.name = "John Boyega"
    john_boyega.bio = "..."
    john_boyega.dob = "1986-03-14"
    john_boyega.image = "meme.jpg"
    john_boyega.save

    visit "/actors/#{john_boyega.id}"
    
    year_label = find("label", :text => /Movie/i)
    for_attribute = year_label[:for]
    
    if for_attribute.nil?
      expect(for_attribute).to_not be_empty,
        "Expected label's for attribute to be set to a non empty value, was '#{for_attribute}' instead."
    else
      all_inputs = all("input")
  
      all_input_ids = all_inputs.map { |input| input[:id] }
  
      expect(all_input_ids.count(for_attribute)).to eq(1),
        "Expected label's for attribute(#{for_attribute}) to match only 1 of the ids of an <input> tag (#{all_input_ids}), but found 0 or more than 1."  
    end

  end
end

describe "/actors/[ACTOR ID]" do
  it "has a <label> with the text 'Actor ID'", points: 1 do
    john_boyega = Actor.new
    john_boyega.name = "John Boyega"
    john_boyega.bio = "..."
    john_boyega.dob = "1986-03-14"
    john_boyega.image = "meme.jpg"
    john_boyega.save

    visit "/actors/#{john_boyega.id}"

    expect(page).to have_tag("label", :text => /Actor ID/i, :count => 1),
      "Expected page to have exactly 1 <label> tag with text 'Actor ID', but didn't find one."
  end
end


describe "/actors/[ACTOR ID]" do
  it "has a label 'Actor ID' with a matching input tag.", :points => 1 do
    
    john_boyega = Actor.new
    john_boyega.name = "John Boyega"
    john_boyega.bio = "..."
    john_boyega.dob = "1986-03-14"
    john_boyega.image = "meme.jpg"
    john_boyega.save
    
    visit "/actors/#{john_boyega.id}"
    
    year_label = find("label", :text => /Actor ID/i)
    for_attribute = year_label[:for]
    
    if for_attribute.nil?
      expect(for_attribute).to_not be_empty,
        "Expected label's for attribute to be set to a non empty value, was '#{for_attribute}' instead."
    else
      all_inputs = all("input")
  
      all_input_ids = all_inputs.map { |input| input[:id] }
  
      expect(all_input_ids.count(for_attribute)).to eq(1),
        "Expected label's for attribute(#{for_attribute}) to match only 1 of the ids of an <input> tag (#{all_input_ids}), but found 0 or more than 1."  
    end

  end
end

describe "/actors/[ACTOR ID]" do
  it "has a form that adds a character record.", :points => 1 do
    
    actor = Actor.new
    actor.name = "Guy Fieri"
    actor.dob = "1970-05-18"
    actor.bio = "Just a guy"
    actor.image = "chicken.png"
    actor.save

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

    visit "/actors/#{actor.id}"
    
    fill_in "Character", with: "1st Pilot"
    fill_in "Movie", with: movie.id
    fill_in "Actor ID", with: actor.id

    click_on "Add character"

    new_character = Character.where({ :actor_id => actor.id, :movie_id => movie.id  }).at(0)

    expect(new_character.name).to eq("1st Pilot"),
      "Expected new character name to save when the form submitted but didn't."
    expect(new_character.movie_id).to eq(movie.id),
      "Expected new character dob to save when the form submitted but didn't."
    expect(new_character.actor_id).to eq(actor.id),
      "Expected new character bio to save when the form submitted but didn't."


  end
end

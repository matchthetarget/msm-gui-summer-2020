require "rails_helper"

describe "/actors/[ACTOR ID]" do
  it "has form to create a edit/update actor record", points: 1 do
    
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
    director = Actor.new
    director.name = "Beets Witherspoon"
    director.bio = "..."
    director.dob = "1976-04-13"
    director.image = "image.jpg"
    director.save

    visit "/actors/#{director.id}"

    expect(page).to have_css("input[value='Beets Witherspoon']")
  end
end

describe "/actors/[ACTOR ID]" do
  it "has Actor dob prepopulated in an input element", :points => 1, hint: h("value_attribute") do
    director = Actor.new
    director.name = "Beets Witherspoon"
    director.bio = "..."
    director.dob = "1976-04-13"
    director.image = "image.jpg"
    director.save

    visit "/actors/#{director.id}"

    expect(page).to have_css("input[value='1976-04-13']")
  end
end

describe "/actors/[ACTOR ID]" do
  it "has Actor image prepopulated in an input element", :points => 1, hint: h("value_attribute") do
    director = Actor.new
    director.name = "Beets Witherspoon"
    director.bio = "..."
    director.dob = "1976-04-13"
    director.image = "director-image.jpg"
    director.save

    visit "/actors/#{director.id}"

    expect(page).to have_css("input[value='director-image.jpg']")
  end
end

describe "/actors/[ACTOR ID]" do
  it "has Actor bio prepopulated in a textarea element", :points => 1 do
    director = Actor.new
    director.name = "Beets Witherspoon"
    director.bio = "the person really loves film"
    director.dob = "1976-04-13"
    director.image = "image.jpg"
    director.save

    visit "/actors/#{director.id}"

    first_textarea = find("textarea")
    expect(first_textarea.value).to match(/the person really loves film/),
      "Couldn't find 'the person really loves film' in the textarea. Hint: Textareas don't use the value attribute like inputs. Try adding the content in-between the opening and closing tag."
  end
end

describe "/actors/[ACTOR ID]" do
  it "has a form that updates an existing actor record.", :points => 1 do
    
    director = Actor.new
    director.name = "Guy Fieri"
    director.dob = "1970-05-18"
    director.bio = "Just a guy"
    director.image = "chicken.png"
    director.save

    visit "/actors/#{director.id}"
    
    fill_in "Name", with: "Sasha Braus"
    fill_in "DOB", with: "2034-12-13"
    fill_in "Bio", with: "holy cow"
    fill_in "Image", with: "profile.jpg"

    click_on "Update actor"

    updated_director = Actor.where({ :id => director.id }).at(0)

    expect(updated_director.name).to eq("Sasha Braus"),
      "Expected director name to update when the form submitted but didn't."
    expect(updated_director.dob.to_s).to eq("2034-12-13"),
      "Expected director dob to update when the form submitted but didn't."
    expect(updated_director.bio).to eq("holy cow"),
      "Expected director bio to update when the form submitted but didn't."
    expect(updated_director.image).to eq("profile.jpg"),
      "Expected director image to update when the form submitted but didn't."


  end
end

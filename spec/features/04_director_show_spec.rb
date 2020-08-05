require "rails_helper"

describe "/directors/[DIRECTOR ID]" do
  it "has form to edit/update director record", points: 1 do
    
    carole_danvers = Director.new
    carole_danvers.name = "Carole Danvers"
    carole_danvers.bio = "..."
    carole_danvers.dob = "1976-03-14"
    carole_danvers.image = "image.jpg"
    carole_danvers.save

    visit "/directors/#{carole_danvers.id}"

    expect(page).to have_tag("form", :min => 1),
      "Expect '/directors/[DIRECTOR ID]' page to have minimum of one <form> tag, but couldn't find one."
  end
end

describe "/directors/[DIRECTOR ID]" do
  it "has Director name prepopulated in an input element", :points => 1, hint: h("value_attribute") do
    director = Director.new
    director.name = "Beets Witherspoon"
    director.bio = "..."
    director.dob = "1976-04-13"
    director.image = "image.jpg"
    director.save

    visit "/directors/#{director.id}"

    expect(page).to have_css("input[value='Beets Witherspoon']")
  end
end

describe "/directors/[DIRECTOR ID]" do
  it "has Director dob prepopulated in an input element", :points => 1, hint: h("value_attribute") do
    director = Director.new
    director.name = "Beets Witherspoon"
    director.bio = "..."
    director.dob = "1976-04-13"
    director.image = "image.jpg"
    director.save

    visit "/directors/#{director.id}"

    expect(page).to have_css("input[value='1976-04-13']")
  end
end

describe "/directors/[DIRECTOR ID]" do
  it "has Director image prepopulated in an input element", :points => 1, hint: h("value_attribute") do
    director = Director.new
    director.name = "Beets Witherspoon"
    director.bio = "..."
    director.dob = "1976-04-13"
    director.image = "director-image.jpg"
    director.save

    visit "/directors/#{director.id}"

    expect(page).to have_css("input[value='director-image.jpg']")
  end
end

describe "/directors/[DIRECTOR ID]" do
  it "has Director bio prepopulated in a textarea element", :points => 1 do
    director = Director.new
    director.name = "Beets Witherspoon"
    director.bio = "the person really loves film"
    director.dob = "1976-04-13"
    director.image = "image.jpg"
    director.save

    visit "/directors/#{director.id}"

    first_textarea = find("textarea")
    expect(first_textarea.value).to match(/the person really loves film/),
      "Couldn't find 'the person really loves film' in the textarea. Hint: Textareas don't use the value attribute like inputs. Try adding the content in-between the opening and closing tag."
  end
end

describe "/directors/[DIRECTOR ID]" do
  it "has a form that updates an existing director record.", :points => 1 do
    
    director = Director.new
    director.name = "Guy Fieri"
    director.dob = "1970-05-18"
    director.bio = "Just a guy"
    director.image = "chicken.png"
    director.save

    visit "/directors/#{director.id}"
    
    fill_in "Name", with: "Sasha Braus"
    fill_in "DOB", with: "2034-12-13"
    fill_in "Bio", with: "holy cow"
    fill_in "Image", with: "profile.jpg"

    click_on "Update director"

    updated_director = Director.where({ :id => director.id }).at(0)

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

describe "/directors/[DIRECTOR ID]" do
  it "has a link with text 'Delete director'", :points => 1 do
    director = Director.new
    director.name = "Beets Witherspoon"
    director.bio = "..."
    director.dob = "1976-04-13"
    director.image = "image.jpg"
    director.save

    visit "/directors/#{director.id}"

    expect(page).to have_tag("a", :text => /Delete director/i)
  end
end

describe "/directors/[DIRECTOR ID]" do
  it "has a 'Delete director' link that removes the director record from the database", :points => 1 do
    director = Director.new
    director.name = "Beets Witherspoon"
    director.bio = "..."
    director.dob = "1976-04-13"
    director.image = "image.jpg"
    director.save

    old_directors_count = Director.all.count

    visit "/directors/#{director.id}"

    find("a", :text => /Delete director/i ).click

    expect(old_directors_count). to be > Director.all.count
  end
end

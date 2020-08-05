require "rails_helper"

describe "/movies" do
  describe "/movies" do
    it "has form to create a new movie record", points: 1 do
      visit "/movies"
  
      expect(page).to have_tag("form", :count => 1),
        "Expect '/movies' page to have exactly one <form> tag, but couldn't find one. "
    end
  end
end

describe "/movies" do
  it "has a <label> with the text 'Title'", points: 1 do
    visit "/movies"

    expect(page).to have_tag("label", :text => /Title/i, :count => 1),
      "Expected page to have exactly 1 <label> tag with text 'Title', but didn't find one."
  end
end

describe "/movies" do
  it "has a label 'Title' with a matching input tag.", :points => 1 do
    visit "/movies"
    
    name_label = find("label", :text => /Title/i)
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

describe "/movies" do
  it "has a <label> with the text 'Year'", points: 1 do
    visit "/movies"

    expect(page).to have_tag("label", :text => /Year/i, :count => 1),
      "Expected page to have exactly 1 <label> tag with text 'Year', but didn't find one."
  end
end


describe "/movies" do
  it "has a label 'Year' with a matching input tag.", :points => 1 do
    visit "/movies"
    
    year_label = find("label", :text => /Year/i)
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

describe "/movies" do
  it "has a <label> with the text 'Description'", points: 1 do
    visit "/movies"

    expect(page).to have_tag("label", :text => /Description/i, :count => 1),
      "Expected page to have exactly 1 <label> tag with text 'Description', but didn't find one."
  end
end


describe "/movies" do
  it "has a label 'Description' with a matching textarea tag.", :points => 1 do
    visit "/movies"
    
    bio_label = find("label", :text => /Description/i)
    for_attribute = bio_label[:for]
    
    if for_attribute.nil?
      expect(for_attribute).to_not be_empty,
        "Expected label's for attribute to be set to a non empty value, was '#{for_attribute}' instead."
    else
      all_textareas = all("textarea")
  
      all_textarea_ids = all_textareas.map { |textarea| textarea[:id] }
  
      expect(all_textarea_ids.count(for_attribute)).to eq(1),
        "Expected label's for attribute(#{for_attribute}) to match only 1 of the ids of an <textarea> tag (#{all_textarea_ids}), but found 0 or more than 1."  
    end

  end
end

describe "/movies" do
  it "has a <label> with the text 'Image'", points: 1 do
    visit "/movies"

    expect(page).to have_tag("label", :text => /Image/i, :count => 1),
      "Expected page to have exactly 1 <label> tag with text 'Image', but didn't find one."
  end
end

describe "/movies" do
  it "has a label 'Image' with a matching input tag.", :points => 1 do
    visit "/movies"
    
    image_label = find("label", :text => /Image/i)
    for_attribute = image_label[:for]
    
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

describe "/movies" do
  it "has a <label> with the text 'Director'", points: 1 do
    visit "/movies"

    expect(page).to have_tag("label", :text => /Director/i, :count => 1),
      "Expected page to have exactly 1 <label> tag with text 'Director', but didn't find one."
  end
end


describe "/movies" do
  it "has a label 'Director' with a matching input tag.", :points => 1 do
    visit "/movies"
    
    image_label = find("label", :text => /Director/i)
    for_attribute = image_label[:for]
    
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

describe "/movies" do
  it "has a form that creates a new movie record.", :points => 1 do
    
    director = Director.new
    director.name = "Guy Fieri"
    director.dob = "1970-05-18"
    director.bio = "Just a guy"
    director.image = "chicken.png"
    director.save

    old_movies_count = Movie.all.count

    visit "/movies"
    
    fill_in "Title", with: "Boris Adventure"
    fill_in "Year", with: "2034"
    fill_in "Description", with: "desc"
    fill_in "Duration", with: "99"
    fill_in "Image", with: "japan.jpg"
    fill_in "Director", with: director.id

    click_on "Add movie"

    expect(old_movies_count).to be < Movie.all.count


  end
end

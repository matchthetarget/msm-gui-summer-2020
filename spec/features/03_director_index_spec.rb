require "rails_helper"


describe "/directors" do
  it "has form to create a new director record", points: 1 do
    visit "/directors"

    expect(page).to have_tag("form", :count => 1),
      "Expect '/directors' page to have exactly one <form> tag, but couldn't find one. "
  end
end


describe "/directors" do
  it "has a <label> with the text 'Name'", points: 1 do
    visit "/directors"

    expect(page).to have_tag("label", :text => /Name/i, :count => 1),
      "Expected page to have exactly 1 <label> tag with text 'Name', but didn't find one."
  end
end

describe "/directors" do
  it "has a label 'Name' with a matching input tag.", :points => 1 do
    visit "/directors"
    
    name_label = find("label", :text => /Name/i)
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

describe "/directors" do
  it "has a <label> with the text 'DOB'", points: 1 do
    visit "/directors"

    expect(page).to have_tag("label", :text => /DOB/i, :count => 1),
      "Expected page to have exactly 1 <label> tag with text 'DOB', but didn't find one."
  end
end


describe "/directors" do
  it "has a label 'DOB' with a matching input tag.", :points => 1 do
    visit "/directors"
    
    year_label = find("label", :text => /DOB/i)
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

describe "/directors" do
  it "has a <label> with the text 'Bio'", points: 1 do
    visit "/directors"

    expect(page).to have_tag("label", :text => /Bio/i, :count => 1),
      "Expected page to have exactly 1 <label> tag with text 'Bio', but didn't find one."
  end
end


describe "/directors" do
  it "has a label 'Bio' with a matching textarea tag.", :points => 1 do
    visit "/directors"
    
    bio_label = find("label", :text => /Bio/i)
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

describe "/directors" do
  it "has a <label> with the text 'Image'", points: 1 do
    visit "/directors"

    expect(page).to have_tag("label", :text => /Image/i, :count => 1),
      "Expected page to have exactly 1 <label> tag with text 'Image', but didn't find one."
  end
end

describe "/directors" do
  it "has a label 'Image' with a matching input tag.", :points => 1 do
    visit "/directors"
    
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

describe "/directors" do
  it "has a form that creates a new director record.", :points => 1 do
    
    old_directors_count = Director.all.count

    visit "/directors"
    
    fill_in "Name", with: "Harley Davidson"
    fill_in "DOB", with: "1980-09-10"
    fill_in "Bio", with: "bio"
    fill_in "Image", with: "japan.jpg"

    click_on "Add director"

    expect(old_directors_count).to be < Director.all.count


  end
end

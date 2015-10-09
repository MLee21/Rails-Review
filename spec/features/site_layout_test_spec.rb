require "rails_helper"

feature "Site Layout Test" do  

  scenario "test the layout links" do 
    visit root_path
    expect(current_path).to eq(root_path)
    expect(page).to have_link("Help")
    expect(page).to have_link("About")
    expect(page).to have_link("Contact")
  end
end
  

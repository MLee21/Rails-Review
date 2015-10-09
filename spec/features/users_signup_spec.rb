require "rails_helper"

feature "A user signs up" do 

  scenario "unsuccessfully" do 
    visit signup_path
    fill_in "Name", with: ""
    fill_in "Email", with: "user@invalid"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "passwor"
    expect(current_path).to eq(signup_path)
  end

  scenario "successfully" do 
    visit signup_path
    fill_in "Name", with: "Joe Shmoe"
    fill_in "Email", with: "js@hotmail.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Create my account"
    expect(page).to have_content("Your account has been created!")
  end
end
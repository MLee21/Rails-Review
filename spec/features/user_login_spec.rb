require "rails_helper"

feature "a user logs in" do 
  let!(:user) {
    User.create!(
      name: "Sally Jones",
      email: "sj@gmail.com",
      password: "password",
      password_confirmation: "password"
    )
  }
  scenario "with invalid information" do 
    visit login_path
    expect(current_path).to eq(login_path)
    fill_in "Email", with: "sj@gmail.com"
    fill_in "Password", with: "password123"
    click_button "Log in"
    expect(page).to have_content("Invalid email/password combination")
    visit root_path
    expect(page).to_not have_content("Invalid email/password combination")
  end

  scenario "with valid information and logs out" do 
    visit login_path
    fill_in "Email", with: "sj@gmail.com"
    fill_in "Password", with: "password"
    click_button "Log in"
    expect(page).to have_content("Account")
    click_on "Account"
    expect(page).to have_content("Profile")
    expect(page).to have_content("Settings")
    expect(page).to have_content("Log out")
    click_on "Account"
    click_on "Log out"
    expect(current_path).to eq(root_path)
  end

  scenario "is not logged in, visits index, and is redirected back to root" do 
    visit users_path
    expect(current_path).to eq(login_path)
  end
end
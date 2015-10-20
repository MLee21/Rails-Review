require "rails_helper"

feature "a user has a profile" do 
  let!(:user) {
    User.create!(
      name: "Sally Jones",
      email: "sj@gmail.com",
      password: "password",
      password_confirmation: "password"
    )
  }
  let!(:user_2) {
    User.create!(
      name: "Jim Smith",
      email: "js@gmail.com",
      password: "password",
      password_confirmation: "password"
    )
  }

  scenario "and edits it successfully" do 
    visit login_path
    expect(current_path).to eq(login_path)
    fill_in "Email", with: "sj@gmail.com"
    fill_in "Password", with: "password"
    click_button "Log in"
    visit edit_user_path(user)
    expect(current_path).to eq(edit_user_path(user))
    fill_in "Email", with: "sj23@gmail.com"
    click_on "Save changes"
    expect(page).to have_content("Profile updated")
  end

  scenario "should redirect edit when not logged in" do 
    visit edit_user_path(user)
    expect(current_path).to eq(login_path)
  end

  scenario "cannot update someone else' profile" do 
    visit login_path
    expect(current_path).to eq(login_path)
    fill_in "Email", with: "sj@gmail.com"
    fill_in "Password", with: "password"
    click_button "Log in"
    visit edit_user_path(user_2)
    expect(current_path).to eq(root_path)
  end
end

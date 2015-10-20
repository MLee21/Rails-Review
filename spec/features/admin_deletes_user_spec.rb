require "rails_helper"

feature "An admin" do 

  before(:each) do 
    User.create!(
      name: "Sally Jones",
      email: "sj@gmail.com",
      password: "password",
      password_confirmation: "password",
      admin: true
    )

    30.times do |n|
      User.create!(
        name: "user#{n+1}",
        email: "user#{n+1}@gmail.com",
        password: "password",
        password_confirmation: "password"
      )
    end
  end

  scenario "cannot delete a user if not logged in" do 
    visit users_path
    expect(current_path).to eq(login_path)
  end

  scenario "can delete a user if logged in" do 
    visit login_path
    fill_in "Email", with: "sj@gmail.com"
    fill_in "Password", with: "password"
    click_button "Log in"
    click_on "Users"
    expect{ first(:link, 'Delete').click }.to change(User, :count).by(-1)
  end
end
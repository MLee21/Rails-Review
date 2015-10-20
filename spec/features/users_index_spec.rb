require "rails_helper"

feature "a logged in user" do 

  before(:each) do 
    User.create!(
      name: "Sally Jones",
      email: "sj@gmail.com",
      password: "password",
      password_confirmation: "password"
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


  scenario "is able to see a paginated list of users" do 
    visit login_path
    expect(current_path).to eq(login_path)
    fill_in "Email", with: "sj@gmail.com"
    fill_in "Password", with: "password"
    click_button "Log in"
    click_on "Users"
    expect(page).to have_css('div.pagination')
  end
end
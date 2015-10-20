require "rails_helper"

RSpec.describe UsersController, type: :controller do 

  before(:each) do 
    @user = User.create!(
      name: "Sally Jones",
      email: "sj@gmail.com",
      password: "password",
      password_confirmation: "password"
    )
    @user_2 = User.create!(
      name: "Jim Smith",
      email: "js@gmail.com",
      password: "password",
      password_confirmation: "password"
    )
  end

  it "should get new" do 
    get :new
    expect(response).to be_success
  end

end
require "rails_helper"

RSpec.describe User, type: :model do 
  let!(:user) {User.create!(name: "Name", email: "name@example.com", password: "password", password_confirmation: "password")}

  it "should be valid" do 
    expect(user).to be_valid
  end

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:email) }

  it { should validate_length_of(:name) }
  
  it { should validate_length_of(:email) }

  it "should have a length validation on name - too long" do 
    user.name = "a" * 26
    expect(user).to_not be_valid
  end

  it "should have a length validation on email = too long" do 
    user.email = "a" * 26 + "@example.com"
    expect(user).to_not be_valid
  end

  it "should have validations to accept valid email addresses" do 
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      user.email = valid_address
    end
    expect(user).to be_valid
  end

  it "should not accept invalid email addresses" do 
    user.email = "user@hotmail,org"
    expect(user).to_not be_valid
  end

  it { should validate_presence_of(:password) }

  it { should validate_uniqueness_of(:email) }

  it "should have a password with a minimum length" do 
    user.password = user.password_confirmation = "a" * 5
    expect(user).to_not be_valid
  end
  
end
User.create!(
  name: "Example User",
  email: "example@railstutorial.org",
  password: "foobar",
  password_confirmation: "foobar",
  admin: true
)

99.times do |n|
  name = Faker::Name.name 
  email = "#{n+1}@gmail.com"
  password = "password"
  User.create!(
    name: name,
    email: email,
    password: password, 
    password_confirmation: password
  )
end
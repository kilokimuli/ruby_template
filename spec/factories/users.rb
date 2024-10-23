# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    first_name { "Test" }
    last_name { "User" }
    email { "test@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
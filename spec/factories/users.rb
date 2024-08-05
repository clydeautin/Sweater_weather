FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "pass1234" }
    password_confirmation { "pass1234" }
  end
end
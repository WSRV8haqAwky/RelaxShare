require "refile/file_double"

FactoryBot.define do
  factory :user do
    name { Faker::Lorem.characters(number: 10) }
    email { Faker::Internet.email }
    introduction { Faker::Lorem.characters(number: 20) }
    password { 'password' }
    password_confirmation { 'password' }
    
    after(:build) do |user|
      user.profile_image = Refile::FileDouble.new("dummy", "profile_image.jpeg", content_type: "image/jpeg")
    end
  end
end

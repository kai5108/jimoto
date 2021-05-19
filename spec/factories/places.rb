FactoryBot.define do
  factory :place do
    name { Faker::Lorem.characters(number: 10) }
    capitan { Faker::Lorem.characters(number: 20) }
    address { Faker::Lorem.characters(number: 10) }
    user
  end
end
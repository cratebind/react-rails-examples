FactoryBot.define do
  factory :location do
    name { Faker::Company.name }
    latitude { 37.0902 + rand(-5.0..5.0) }
    longitude { -95.7129 + rand(-5.0..5.0) }
    description { Faker::Company.bs.capitalize + " with " + Faker::Company.catch_phrase.downcase }
  end
end

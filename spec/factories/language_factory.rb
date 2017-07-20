FactoryGirl.define do
  factory :language do
    name { Faker::FamilyGuy.character }
    description { Faker::FamilyGuy.quote }
    documentation_url { Faker::Internet.url }
  end
end

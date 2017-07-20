FactoryGirl.define do
  factory :challenge_rating_criterium do
    name { Faker::Book.title }
    description { Faker::Lorem.paragraph(20) }
    
    challenge
  end
end

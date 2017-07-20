FactoryGirl.define do
  factory :jury_challenge_rate do
    rating { Faker::Number.between(1, 5) }
    informations { Faker::Movie.quote }

    jury_challenge_membership
    challenge_rating_criterium
  end
end

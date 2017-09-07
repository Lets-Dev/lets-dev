FactoryGirl.define do
  factory :jury_challenge_membership_invitation do
    challenge
    user_email { Faker::Internet.email }
    status { :pending }
  end
end

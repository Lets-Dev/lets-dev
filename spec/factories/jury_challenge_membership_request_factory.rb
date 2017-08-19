FactoryGirl.define do
  factory :jury_challenge_membership_request do
    user
    challenge
    status { :pending }
  end
end

FactoryGirl.define do
  factory :team_user_membership_invitation do
    user_email { Faker::Internet.email }
    status { :pending }
    team
  end
end

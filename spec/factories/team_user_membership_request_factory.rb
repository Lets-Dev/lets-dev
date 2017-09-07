FactoryGirl.define do
  factory :team_user_membership_request do
    user
    team
    status { :pending }
  end
end

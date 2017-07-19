FactoryGirl.define do
  factory :team_user_membership do
    team
    user
    started_at { Time.now }
    ended_at( nil ) 
    role { :regular }
  end
end

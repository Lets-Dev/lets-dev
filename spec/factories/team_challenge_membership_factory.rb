FactoryGirl.define do
  factory :team_challenge_membership do
    github_repository 'lets-dev/lets-dev'
    team
    challenge
  end
end

class JuryChallengeRate < ApplicationRecord
    belongs_to :jury_challenge_membership, optional: false
    belongs_to :challenge_rating_criterium, optional: false
    belongs_to :team_challenge_membership, optional: false
    has_one :user, through: :jury_challenge_membership
    has_one :challenge, through: :jury_challenge_membership
    has_one :team, through: :team_challenge_membership

end

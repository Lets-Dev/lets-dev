class JuryChallengeRate < ApplicationRecord
    belongs_to :jury_challenge_membership
    has_one :user, through: :jury_challenge_membership
    has_one :challenge, through: :jury_challenge_membership

    belongs_to :challenge_rating_criterium
end

class ChallengeRatingCriterium < ApplicationRecord
    belongs_to :challenge, optional: false
    has_many :jury_challenge_rates
end

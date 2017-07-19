class TeamChallengeMembership < ApplicationRecord
  belongs_to :team, optional: false
  belongs_to :challenge, optional: false

  validates :challenge, uniqueness: {scope: :team}
end

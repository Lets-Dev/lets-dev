class TeamChallengeMembership < ApplicationRecord
  belongs_to :team, optional: false
  belongs_to :challenge, optional: false

  has_many :jury_challenge_rates

  validates :challenge, uniqueness: {scope: :team}
  validate :min_size_of_team

  protected
  def min_size_of_team
    errors.add(:team, :must_be_2) if self.team && self.team.team_user_memberships.active.size < 2
  end
end

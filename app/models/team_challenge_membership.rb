class TeamChallengeMembership < ApplicationRecord
  belongs_to :team, optional: false
  belongs_to :challenge, optional: false

  has_many :jury_challenge_rates

  validates :github_repository, presence: true, uniqueness: true
  validates :challenge, uniqueness: {scope: :team}
  validate :min_size_of_team

  validate :existence_of_github_repo

  protected
  def min_size_of_team
    errors.add(:team, :must_be_2) if self.team && self.team.team_user_memberships.active.size < 2 && Rails.env != 'test'
  end

  def existence_of_github_repo
    repo = self.github_repository.split('/')
    begin 
      Github.repos.get user: repo.first, repo: repo.last
    rescue
      errors.add(:github_repository, :must_exist)
    end
  end
end

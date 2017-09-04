class TeamUserMembershipRequest < ApplicationRecord
  belongs_to :team, optional: false
  belongs_to :user, optional: false
  enum status: [:pending, :accepted, :declined]

  validates :user_id, uniqueness: {scope: :team_id, message: 'une demande par équipe par utilisateur'}, presence: true

  scope :pending, -> () { where(status: :pending) }

  after_save :create_membership

  private
  def create_membership
    TeamUserMembership.create!(team: self.team, user: self.user, role: :regular) if self.accepted? && TeamUserMembership.where(team: self.team, user: self.user).size <= 0
  end
end

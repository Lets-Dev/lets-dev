class TeamUserMembership < ApplicationRecord
  belongs_to :team, optional: false
  belongs_to :user, optional: false

  enum role: [:regular, :admin, :owner]

  validate :uniqueness_of_active_membership
  validate :uniqueness_of_owner_membership

  scope :active, -> () { where('ended_at IS NULL') }
  scope :owners, -> () { where('ended_at IS NULL AND role = ?', TeamUserMembership.roles[:owner]) }
  scope :admins, -> () { where('ended_at IS NULL AND role IN (?)', [TeamUserMembership.roles[:admin], TeamUserMembership.roles[:owner]]) }

  protected
  def uniqueness_of_active_membership
    errors.add(:base, :must_be_uniq) if self.user && self.ended_at.nil? && self.user.team_user_memberships.active.size > (self.id.nil? ? 0 : 1)
  end

  def uniqueness_of_owner_membership
    errors.add(:base, :uniq_owner) if self.team && self.owner? && self.team.team_user_memberships.owners.size > (self.id.nil? ? 0 : 1)
  end
end

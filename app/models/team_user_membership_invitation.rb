class TeamUserMembershipInvitation < ApplicationRecord
  belongs_to :team, optional: false
  enum status: [:pending, :accepted, :declined]

  after_create :send_invitation

  validates :user_email, uniqueness: {scope: :team_id, message: 'Une invitation par équipe par utilisateur'}, presence: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}

  scope :pending, -> () { where(status: :pending) }
  scope :accepted, -> () { where(status: :accepted) }
  scope :declined, -> () { where(status: :declined) }

  def send_invitation
    TeamInvitationMailer.send_invitation(self).deliver_later
  end
end

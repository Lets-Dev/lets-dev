class JuryChallengeMembershipInvitation < ApplicationRecord
  belongs_to :challenge, optional: false
  enum status: [:pending, :accepted, :declined]

  after_create :send_invitation

  validates :user_email, uniqueness: {scope: :challenge_id, message: 'Une invitation par challenge par utilisateur'}, presence: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}

  scope :pending, -> () { where(status: :pending) }
  scope :accepted, -> () { where(status: :accepted) }
  scope :declined, -> () { where(status: :declined) }

  def send_invitation
    JuryInvitationMailer.send_invitation(self).deliver_later
  end
end

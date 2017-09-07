class JuryChallengeMembershipRequest < ApplicationRecord
  belongs_to :challenge, optional: false
  belongs_to :user, optional: false
  enum status: [:pending, :accepted, :declined]

  validates :user_id, uniqueness: {scope: :challenge_id, message: 'une demande par challenge par utilisateur'}, presence: true
  validate :absence_of_membership

  after_save :create_membership

  private
  def create_membership
    JuryChallengeMembership.create(challenge: self.challenge, user: self.user) if self.accepted? && JuryChallengeMembership.where(challenge: self.challenge, user: self.user).size <= 0
  end

  def absence_of_membership
    errors.add(:base, :membership_exists) if JuryChallengeMembership.exists?(challenge: self.challenge, user: self.user)
  end
end

class JuryInvitationPreview < ActionMailer::Preview
  def send_invitation
    JuryChallengeMembershipInvitation.create(challenge: Challenge.first, user_email: User.first.email) unless JuryChallengeMembershipInvitation.all.size > 0
    JuryInvitationMailer.send_invitation(JuryChallengeMembershipInvitation.first)
  end
end

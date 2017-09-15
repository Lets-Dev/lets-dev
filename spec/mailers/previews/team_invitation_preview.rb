class TeamInvitationPreview < ActionMailer::Preview
  def send_invitation
    TeamUserMembershipInvitation.create(team: Team.first, user_email: User.first.email) unless TeamUserMembershipInvitation.all.size > 0
    TeamInvitationMailer.send_invitation(TeamUserMembershipInvitation.first)
  end
end

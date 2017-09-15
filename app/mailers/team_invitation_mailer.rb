class TeamInvitationMailer < ApplicationMailer
  def send_invitation(team_invitation)
    @team_invitation = team_invitation
    mail(to: team_invitation.user_email, subject: t('mailers.team_invitation.send_invitation.subject', team_name: team_invitation.team.name))
  end
end

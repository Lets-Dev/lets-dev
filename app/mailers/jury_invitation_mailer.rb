class JuryInvitationMailer < ApplicationMailer
  def send_invitation(jury_invitation)
    @jury_invitation = jury_invitation
    mail(to: @jury_invitation.user_email, subject: t('mailers.jury_invitation.send_invitation.subject', challenge_title: @jury_invitation.challenge.title))
  end
end

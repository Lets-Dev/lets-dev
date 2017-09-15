class TeamUserMembershipInvitationsController < ApplicationController
  before_action :set_invitation

  def accept

    # If doesn't exist
    if @invitation.nil?
      redirect_to redirect_path, alert: t('controllers.team_user_membership_invitations.doesnt_exist')

    # If not pending
    elsif !@invitation.pending?
      redirect_to redirect_path, alert: t('controllers.team_user_membership_invitations.expired')

    # If user signed in and his email is the invitation's one
    elsif user_signed_in? && current_user.email == @invitation.user_email
      @membership = TeamUserMembership.new(team: @invitation.team, user: current_user)
      if @membership.save
        @invitation.update(status: :accepted)
        redirect_to manager_root_path, notice: t('controllers.team_user_membership_invitations.accepted', team_name: @invitation.team.name)
      else
        redirect_to manager_root_path, alert: @membership.errors.full_messages
      end

    # If user signed in but his email doesn't match
    elsif user_signed_in? && current_user.email != @invitation.user_email
      redirect_to manager_root_path, alert: t('controllers.team_user_membership_invitations.wrong_user')

    # If user not signed in
    elsif !user_signed_in?
      authenticate_user!
    end
  end

  def decline

    # If doesn't exist
    if @invitation.nil?
      redirect_to redirect_path, alert: t('controllers.team_user_membership_invitations.doesnt_exist')

      # If not pending
    elsif !@invitation.pending?
      redirect_to redirect_path, alert: t('controllers.team_user_membership_invitations.expired')

      # If user signed in and his email is the invitation's one
    elsif user_signed_in? && current_user.email == @invitation.user_email
      if @invitation.update(status: :declined)
        redirect_to manager_root_path, notice: t('controllers.team_user_membership_invitations.declined', team_name: @invitation.team.name)
      else
        redirect_to manager_root_path, alert: @invitation.errors.full_messages
      end

      # If user signed in but his email doesn't match
    elsif user_signed_in? && current_user.email != @invitation.user_email
      redirect_to manager_root_path, alert: t('controllers.team_user_membership_invitations.wrong_user')

      # If user not signed in
    elsif !user_signed_in?
      authenticate_user!
    end
  end

  private
  def set_invitation
    @invitation = TeamUserMembershipInvitation.find(params[:id])
  end

  def redirect_path
    user_signed_in? ? manager_root_path : root_path
  end
end

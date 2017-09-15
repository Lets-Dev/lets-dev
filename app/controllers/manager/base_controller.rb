class Manager::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pending_invitations

  def set_pending_invitations
    @pending_invitations = TeamUserMembershipInvitation.pending.where(user_email: current_user.email)
  end

  layout 'manager/application'
end

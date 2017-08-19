class Manager::TeamUserMembershipRequestsController < Manager::BaseController
  def create
    @team_user_membership_request = TeamUserMembershipRequest.new(user_id: current_user.id, team_id: params[:team_id])

    if @team_user_membership_request.save
      redirect_back fallback_location: manager_root_path, notice: 'Jury challenge membership request was successfully created.'
    else
      redirect_back fallback_location: manager_root_path, alert: @team_user_membership_request.errors.full_messages 
    end
  end
end

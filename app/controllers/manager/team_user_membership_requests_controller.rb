class Manager::TeamUserMembershipRequestsController < Manager::BaseController
  before_action :set_tumr, except: [:create]

  def create
    @team_user_membership_request = TeamUserMembershipRequest.new(user_id: current_user.id, team_id: params[:team_id])

    if @team_user_membership_request.save
      redirect_back fallback_location: manager_root_path, notice: 'Team user membership request was successfully created.'
    else
      redirect_back fallback_location: manager_root_path, alert: @team_user_membership_request.errors.full_messages 
    end
  end
  
  def accept
    if @team_user_membership_request.update(status: :accepted)
      redirect_to manager_team_path(@team_user_membership_request.team), notice: "L'invitation a bien été acceptée"
    else
      redirect_to manager_team_path(@team_user_membership_request.team), alert: @team_user_membership_request.errors.full_messages 
    end
  end
    
  def decline
    if @team_user_membership_request.update(status: :declined)
      redirect_to manager_team_path(@team_user_membership_request.team), notice: "L'invitation a bien été refusée"
    else
      redirect_to manager_team_path(@team_user_membership_request.team), alert: @team_user_membership_request.errors.full_messages 
    end
  end

  private
  def set_tumr
    @team_user_membership_request = TeamUserMembershipRequest.find(params[:id])
  end
end

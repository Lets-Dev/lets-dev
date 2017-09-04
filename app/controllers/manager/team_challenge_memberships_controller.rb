class Manager::TeamChallengeMembershipsController < Manager::BaseController
  def create
    puts params.to_json
    @team_challenge_membership_request = TeamChallengeMembership.new(tcm_params)
    @team_challenge_membership_request.team = current_user.current_team

    if @team_challenge_membership_request.save
      redirect_back fallback_location: manager_challenge_path(@team_challenge_membership_request.challenge), notice: 'Team challenge membership was successfully created.'
    else
      redirect_back fallback_location: manager_challenge_path(@team_challenge_membership_request.challenge), alert: @team_challenge_membership_request.errors.full_messages 
    end
  end

  private
  def tcm_params
    params.require(:team_challenge_membership).permit(:challenge_id, :github_repository)
  end
end

class Manager::JuryChallengeMembershipRequestsController < Manager::BaseController
  def create
    @jury_challenge_membership_request = JuryChallengeMembershipRequest.new(user_id: current_user.id, challenge_id: params[:challenge_id])

    if @jury_challenge_membership_request.save
      redirect_back fallback_location: manager_root_path, notice: 'Jury challenge membership request was successfully created.'
    else
      redirect_back fallback_location: manager_root_path, alert: @jury_challenge_membership_request.errors.full_messages 
    end
  end
end

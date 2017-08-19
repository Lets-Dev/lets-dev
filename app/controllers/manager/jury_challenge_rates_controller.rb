class Manager::JuryChallengeRatesController < Manager::BaseController
  before_action :set_manager_jury_challenge_rate, only: [:create]

  def new
    @challenge = Challenge.find(params[:challenge_id])
    @challenge_memberships = @challenge.team_challenge_memberships
    @criteria = @challenge.challenge_rating_criteria
  end

  def create
    if @manager_jury_challenge_rate.update(manager_jury_challenge_rate_params)
      render json: @manager_jury_challenge_rate, status: :ok
    else
      render json: @manager_jury_challenge_rate.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manager_jury_challenge_rate
      criterium = ChallengeRatingCriterium.find(manager_jury_challenge_rate_params[:challenge_rating_criterium_id])
      render nothing: true, status: :not_found and return if criterium.nil?
      membership = JuryChallengeMembership.find_by(user: current_user, challenge: criterium.challenge)
      render nothing: true, status: :unauthorized and return if membership.nil?
      @manager_jury_challenge_rate = JuryChallengeRate.where(challenge_rating_criterium: criterium, jury_challenge_membership: membership).first_or_create
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manager_jury_challenge_rate_params
      params.require(:jury_challenge_rate).permit(:challenge_rating_criterium_id, :rating, :informations, :team_challenge_membership_id)
    end
end

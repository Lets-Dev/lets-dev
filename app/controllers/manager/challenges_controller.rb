class Manager::ChallengesController < Manager::BaseController
  before_action :set_challenge, only: [:show]

  def index
    @current_challenges = Challenge.current
    @ended_challenges = Challenge.ended
    @best_teams = ActiveRecord::Base.connection.execute('SELECT SUM(rating) as rating, teams.name as team_name FROM jury_challenge_rates
      LEFT JOIN team_challenge_memberships ON team_challenge_membership_id = team_challenge_memberships.id
      LEFT JOIN teams ON team_id = teams.id
      GROUP BY team_challenge_membership_id, teams.id
      ORDER BY rating DESC')
  end

  def show
  end

  private
  def set_challenge
    @challenge = Challenge.find(params[:id])
  end
end

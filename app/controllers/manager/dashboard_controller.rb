class Manager::DashboardController < Manager::BaseController
  def index
    @challenges = Challenge.current
    @pending_challenges = current_user
      .jury_challenge_memberships
      .joins(:challenge)
      .where('challenges.ends_at > ? AND challenges.ends_at < ?', Time.now - 1.month, Time.now)
      .map {|m| m.challenge}
    @best_teams = ActiveRecord::Base.connection.execute('SELECT SUM(rating) as rating, teams.name as team_name FROM jury_challenge_rates
      LEFT JOIN team_challenge_memberships ON team_challenge_membership_id = team_challenge_memberships.id
      LEFT JOIN teams ON team_id = teams.id
      GROUP BY team_challenge_membership_id, teams.id
      ORDER BY rating').first(3)
  end
end

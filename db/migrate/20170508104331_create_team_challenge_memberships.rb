class CreateTeamChallengeMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :team_challenge_memberships, id: :uuid do |t|
      t.belongs_to :team, type: :uuid
      t.belongs_to :challenge, type: :uuid
      t.string :github_repository

      t.timestamps
    end
  end
end

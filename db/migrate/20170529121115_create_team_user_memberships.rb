class CreateTeamUserMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :team_user_memberships, id: :uuid do |t|
      t.belongs_to :team, type: :uuid
      t.belongs_to :user, type: :uuid
      t.integer :role
      t.datetime :started_at
      t.datetime :ended_at

      t.timestamps
    end
  end
end

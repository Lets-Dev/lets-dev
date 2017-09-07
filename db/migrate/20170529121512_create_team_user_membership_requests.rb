class CreateTeamUserMembershipRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :team_user_membership_requests, id: :uuid do |t|
      t.belongs_to :team, type: :uuid
      t.belongs_to :user, type: :uuid
      t.integer :status, default: 0

      t.timestamps
    end
  end
end

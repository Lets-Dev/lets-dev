class CreateJuryChallengeMembershipRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :jury_challenge_membership_requests, id: :uuid do |t|
      t.belongs_to :challenge, type: :uuid
      t.belongs_to :user, type: :uuid
      t.integer :status, default: 0

      t.timestamps
    end
  end
end

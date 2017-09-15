class CreateJuryChallengeMembershipInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :jury_challenge_membership_invitations, id: :uuid do |t|
      t.belongs_to :challenge, type: :uuid
      t.string :user_email
      t.integer :status, default: 0

      t.timestamps
    end
  end
end

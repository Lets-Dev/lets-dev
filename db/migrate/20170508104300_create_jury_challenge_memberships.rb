class CreateJuryChallengeMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :jury_challenge_memberships, id: :uuid do |t|
      t.belongs_to :user, type: :uuid
      t.belongs_to :challenge, type: :uuid

      t.timestamps
    end
  end
end

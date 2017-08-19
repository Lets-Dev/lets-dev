class CreateJuryChallengeRates < ActiveRecord::Migration[5.0]
  def change
    create_table :jury_challenge_rates, id: :uuid do |t|
      t.integer :rating
      t.text :informations
      t.belongs_to :jury_challenge_membership, type: :uuid
      t.belongs_to :challenge_rating_criterium, type: :uuid
      t.belongs_to :team_challenge_membership, type: :uuid

      t.timestamps
    end
  end
end

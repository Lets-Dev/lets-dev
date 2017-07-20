class CreateChallengeRatingCriteria < ActiveRecord::Migration[5.0]
  def change
    create_table :challenge_rating_criteria, id: :uuid do |t|
      t.string :name
      t.text :description
      t.belongs_to :challenge, type: :uuid

      t.timestamps
    end
  end
end

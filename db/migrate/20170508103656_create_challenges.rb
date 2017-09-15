class CreateChallenges < ActiveRecord::Migration[5.0]
  def change
    create_table :challenges, id: :uuid do |t|
      t.string :title
      t.text :subject
      t.datetime :starts_at
      t.datetime :ends_at

      t.belongs_to :language_set, type: :uuid

      t.timestamps
    end
  end
end

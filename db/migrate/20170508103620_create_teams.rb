class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.text :description

      t.attachment :logo

      t.timestamps
    end
  end
end

class CreateLanguageSetMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :language_set_memberships, id: :uuid do |t|
      t.belongs_to :language, type: :uuid
      t.belongs_to :language_set, type: :uuid

      t.timestamps
    end
  end
end

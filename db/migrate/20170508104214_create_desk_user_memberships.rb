class CreateDeskUserMemberships < ActiveRecord::Migration[5.0]
  def change
    create_table :desk_user_memberships, id: :uuid do |t|
      t.belongs_to :desk, type: :uuid
      t.belongs_to :user, type: :uuid

      t.timestamps
    end
  end
end

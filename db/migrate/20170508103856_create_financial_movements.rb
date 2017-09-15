class CreateFinancialMovements < ActiveRecord::Migration[5.0]
  def change
    create_table :financial_movements, id: :uuid do |t|
      t.float :amount
      t.text :description

      t.belongs_to :user, type: :uuid

      t.timestamps
    end
  end
end

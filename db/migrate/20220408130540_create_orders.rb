class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :seller, null: false, foreign_key: true
      t.float :price
      t.string :status, default: "pending"

      t.timestamps
    end
  end
end

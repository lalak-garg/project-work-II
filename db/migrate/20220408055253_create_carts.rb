class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.integer :quantity
      t.references :product, null: false, foreign_key: true
      t.references :payment, null: false, foreign_key: true
      t.decimal :total

      t.timestamps
    end
  end
end

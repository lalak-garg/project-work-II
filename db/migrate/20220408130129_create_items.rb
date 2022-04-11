class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :quantity
      t.integer :cart_id
      t.integer :order_id

      t.timestamps
    end
  end
end

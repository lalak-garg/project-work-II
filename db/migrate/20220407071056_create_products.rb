class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :category, null: false, foreign_key: true
      t.references :seller, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.decimal :price
      t.boolean :available, default: true

      t.timestamps
    end
  end
end

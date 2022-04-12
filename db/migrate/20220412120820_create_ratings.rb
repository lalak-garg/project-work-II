class CreateRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :ratings do |t|
      t.references :seller, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.float :score

      t.timestamps
    end
  end
end

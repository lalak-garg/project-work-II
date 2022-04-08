class CreateSellers < ActiveRecord::Migration[7.0]
  def change
    create_table :sellers do |t|
      t.string :name
      t.text :address
      t.string :status

      t.timestamps
    end
  end
end

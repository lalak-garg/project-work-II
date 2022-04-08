class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.decimal :subtotal
      t.decimal :total

      t.timestamps
    end
  end
end

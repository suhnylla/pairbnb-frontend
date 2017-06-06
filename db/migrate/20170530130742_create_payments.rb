class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :reservation_id, index: true, foreign_key: true
      t.integer :total_amount

      t.timestamps null: false
    end
  end
end

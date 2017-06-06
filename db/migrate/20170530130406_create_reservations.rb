class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :listing_id
      t.integer :user_id
      t.date :start_date
      t.date :end_date
      t.integer :no_days_stay

      t.timestamps null: false
    end
  end
end

class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :trip_id
      t.integer :user_id
      t.text :review
      t.integer :place_id

      t.timestamps null: false
    end
  end
end

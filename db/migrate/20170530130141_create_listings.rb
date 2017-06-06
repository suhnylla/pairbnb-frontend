class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.references :user, index: true, foreign_key: true
      t.string :description
      t.string :accomodates_no_persons
      t.string :address
      t.string :city
      t.string :price
      t.string :photo_url
      t.boolean :smooking
      t.boolean :pet_friendly
      t.boolean :apartment
      t.boolean :house
      t.integer :house_type
      t.date :start_date
      t.date :end_date

      t.timestamps null: false
    end
  end
end

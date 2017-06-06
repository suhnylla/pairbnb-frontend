class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :state
      t.string :country
      t.references :listing, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

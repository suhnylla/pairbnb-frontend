class CreateMessageThreads < ActiveRecord::Migration
  def change
    create_table :message_threads do |t|
      t.integer :owner_id
      t.integer :sender_id

      t.timestamps null: false
    end
  end
end

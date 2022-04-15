class CreateNotificationsTable < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.string :title
      t.text :note
      t.boolean :viewed
      t.integer :sender_id
      t.integer :recipient_id
      t.timestamps
    end
  end
end

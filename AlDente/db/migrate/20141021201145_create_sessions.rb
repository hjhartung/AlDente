class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.text :waiter_name
      t.integer :ipadID
      t.integer :restaurant_id
      t.integer :user_id

      t.timestamps
    end
  end
end

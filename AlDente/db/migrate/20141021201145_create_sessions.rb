class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.text :waiter_name
      t.integer :ipad_id
      t.integer :restaurant_id
      t.integer :pin
      t.integer :party_size

      t.timestamps
    end
  end
end

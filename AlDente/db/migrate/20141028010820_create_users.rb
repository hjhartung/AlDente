class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :restaurant_id
      t.string :role
      t.boolean :active
      t.string :password_digest

      t.timestamps
    end
  end
end

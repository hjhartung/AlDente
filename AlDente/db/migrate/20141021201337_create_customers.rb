class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.boolean :paid
      t.integer :session_id
      t.decimal :tip_percentage

      t.timestamps
    end
  end
end

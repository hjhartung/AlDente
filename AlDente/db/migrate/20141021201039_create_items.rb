class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :cost
      t.string :category
      t.boolean :available
      t.integer :restaurant_id

      t.timestamps
    end
  end
end

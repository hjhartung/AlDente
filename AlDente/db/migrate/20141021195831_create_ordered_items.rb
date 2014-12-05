class CreateOrderedItems < ActiveRecord::Migration
  def change
    create_table :ordered_items do |t|
      t.integer :session_id
      t.integer :item_id
      t.text :comments

      t.timestamps
    end
  end
end

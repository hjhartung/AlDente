class CreateItemSplits < ActiveRecord::Migration
  def change
    create_table :item_splits do |t|
      t.integer :ordered_items_id
      t.integer :customer_id
      t.decimal :percentage
      t.text :details

      t.timestamps
    end
  end
end

class RenameSessionIdToOrderIdInOrderedItems < ActiveRecord::Migration
  def change
  	rename_column :ordered_items, :session_id, :order_id
  end
end

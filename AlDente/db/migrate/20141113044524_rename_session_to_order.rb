class RenameSessionToOrder < ActiveRecord::Migration
  def change
    rename_table :sessions, :orders
  end
end

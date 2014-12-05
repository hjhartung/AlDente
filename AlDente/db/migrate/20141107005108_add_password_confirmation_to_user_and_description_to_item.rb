class AddPasswordConfirmationToUserAndDescriptionToItem < ActiveRecord::Migration
  def change
  	add_column :users, :password_confirmation, :string
  	add_column :items, :description, :text
  end
end

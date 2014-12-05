class AddTaxPercentageToItems < ActiveRecord::Migration
  def change
    add_column :items, :tax_percentage, :decimal
  end
end

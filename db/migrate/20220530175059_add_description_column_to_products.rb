class AddDescriptionColumnToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :description, :text, default: "", null: false
  end
end

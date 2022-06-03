class AddCommentColumnToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :comment, :text, default: "", null: false
  end
end

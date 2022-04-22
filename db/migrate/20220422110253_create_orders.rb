class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :order_status, null: false, foreign_key: true
      t.decimal :amount, null: false, precision: 15, scale: 2

      t.timestamps
    end
  end
end

class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.references :order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.decimal :price, null: false, precision: 15, scale: 2
      t.integer :qty, null: false

      t.timestamps
    end
  end
end

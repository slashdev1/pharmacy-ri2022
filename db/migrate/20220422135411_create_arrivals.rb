class CreateArrivals < ActiveRecord::Migration[6.1]
  def change
    create_table :arrivals do |t|
      t.references :product, null: false, foreign_key: true
      t.decimal :price, null: false, precision: 15, scale: 2
      t.integer :qty, null: false

      t.timestamps
    end
  end
end

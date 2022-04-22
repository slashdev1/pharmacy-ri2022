class CreateStock < ActiveRecord::Migration[6.1]
  def change
    create_table :stock do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :qty, null: false
      t.integer :reserve_qty, null: false

      t.timestamps
    end
  end
end

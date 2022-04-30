class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.boolean :required_prescription, null: false
      t.decimal :price, null: false, precision: 15, scale: 2
      t.integer :for_adult_children, null: false

      t.timestamps
    end
  end
end

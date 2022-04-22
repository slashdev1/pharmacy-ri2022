class CreatePrescriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :prescriptions do |t|
      t.string :number, null: false
      t.boolean :is_used, null: false
      t.references :doctor, null: false, foreign_key: { to_table: :users }
      t.integer :for_adult_children, null: false

      t.timestamps
    end
  end
end

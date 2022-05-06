class AddProductToPrescriptions < ActiveRecord::Migration[6.1]
  def change
    add_reference :prescriptions, :product, index: true, foreign_key: true, null: false
  end
end

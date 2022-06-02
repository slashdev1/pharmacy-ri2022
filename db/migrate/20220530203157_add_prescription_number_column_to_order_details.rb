class AddPrescriptionNumberColumnToOrderDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :order_details, :prescription_number, :string, default: "", null: false
  end
end

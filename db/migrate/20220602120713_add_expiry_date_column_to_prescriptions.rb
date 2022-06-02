class AddExpiryDateColumnToPrescriptions < ActiveRecord::Migration[6.1]
  def change
    add_column :prescriptions, :expiry_date, :date, null: false, default: -> { 'CURRENT_TIMESTAMP' }
  end
end

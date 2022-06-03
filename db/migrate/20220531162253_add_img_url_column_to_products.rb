class AddImgUrlColumnToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :img_url, :string, default: '', null: false
  end
end

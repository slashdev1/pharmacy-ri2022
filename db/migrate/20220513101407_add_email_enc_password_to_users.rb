class AddEmailEncPasswordToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :email, :string,null: false, default: ""
    add_column :users, :encrypted_password, :string,null: false, default: ""
  end
end

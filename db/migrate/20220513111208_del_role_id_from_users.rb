class DelRoleIdFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :old_role_id
  end
end

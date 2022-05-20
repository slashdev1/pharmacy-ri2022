class TransitionToUsingRolesEnum < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :role_id, :old_role_id
    add_column :users, :role, :integer,null: false, default: 0

    User.all.each do |user|
      user.role = user.old_role_id
      user.save
    end
  end
end

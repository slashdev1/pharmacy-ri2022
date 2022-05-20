namespace :update20222005 do
  desc "TODO"
  task do: :environment do

    User.all.each do |user|
      user.role = user.old_role_id
      user.save
    end

  end

end

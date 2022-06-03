namespace :update20222005 do
  desc "transition new filed role in model User"
  task do: :environment do

    User.all.each do |user|
      user.role = user.old_role_id
      user.save
    end

  end

end

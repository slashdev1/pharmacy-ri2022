namespace :update20222005_2 do
  desc "fill emails by default in model User"
  task do: :environment do

    User.all.each do |user|
      user.email = "mail#{user.id}@example.com"
      user.save
    end

  end

end

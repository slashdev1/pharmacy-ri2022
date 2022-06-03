namespace :default_admin do
  desc "Creating admin"
  task make: :environment do
    User.create! do |u|
      u.email = 'admin@admin.com'
      u.password = 'crossword'
      u.password_confirmation = 'crossword'
      u.role = User.roles[:user]
      u.name = 'Super Admin'
      u.admin = true
    end
  end

end

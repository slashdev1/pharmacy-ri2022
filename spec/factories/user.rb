FactoryBot.define do
  factory :user do
    name { 'Фармацевт Аня' }
    role_id { 1 }
  end
  factory :no_valid_name_user, class: User do
    name { 'Ф' }
    role_id { 1 }
  end
end
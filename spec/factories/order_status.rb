FactoryBot.define do
  factory :status, class: OrderStatus do
    name { 'Отложен' }
  end
  factory :no_uniq_name_status, class: OrderStatus do
    name { 'Отложен' }
  end
end
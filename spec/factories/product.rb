FactoryBot.define do
  factory :product_children, class: Product do
    name  { 'Подгузники' }
    required_prescription { false }
    price { 100 }
    for_adult_children { 1 }
  end
  factory :product_adult, class: Product do
    name  { 'Аспирин АйСи' }
    required_prescription { false }
    price { 50 }
    for_adult_children { 0 }
  end
end
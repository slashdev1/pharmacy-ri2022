FactoryBot.define do
  factory :stock, class: Stock do
    product_id { 2 }
  end
  factory :no_valid_product_stock, class: Stock do
    product_id { 0 }
  end
end
FactoryBot.define do
  factory :detail, class: OrderDetail do
    qty { 2 }
    price  { 3.99 }
    product_id { 1 }
  end
  factory :no_valid_qty_detail, class: OrderDetail do
    qty { 0 }
    price  { 3.99 }
    product_id { 1 }
  end
  factory :no_valid_product_detail, class: OrderDetail do
    qty { 3 }
    price  { 4.99 }
    product_id { 0 }
  end
end
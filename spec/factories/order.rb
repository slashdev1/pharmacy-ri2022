FactoryBot.define do
  factory :order, class: Order do
    amount  { 7.98 }
    order_status_id { 2 }
    user_id { 1 }
  end
  factory :no_valid_status_order, class: Order do
    amount  { 2.99 }
    order_status_id { 0 }
    user_id { 1 }
  end
  factory :no_valid_amount_order, class: Order do
    amount  { 0 }
    order_status_id { 2 }
    user_id { 1 }
  end
end
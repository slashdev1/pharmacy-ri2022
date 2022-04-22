class Order < ApplicationRecord
  belongs_to :user
  has_one :order_status

  validates :user_id
end

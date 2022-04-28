class Order < ApplicationRecord
  belongs_to :user
  has_one :order_status

  validates :user_id, presence: true
  validates :order_status_id, presence: true
  validates :amount, :numericality => { :greater_than_or_equal_to => 0 }
end

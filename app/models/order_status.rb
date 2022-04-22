class OrderStatus < ApplicationRecord
  has_many :order

  validates :name, presence: true, uniqueness: true
end

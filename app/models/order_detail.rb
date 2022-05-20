class OrderDetail < ApplicationRecord
  belongs_to :order
  has_one :product

  validates :qty, :numericality => { :greater_than_or_equal_to => 0 }
  validates :price, :numericality => { :greater_than_or_equal_to => 0 }
end

class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 300 }
  validates :price, :numericality => { :greater_than_or_equal_to => 0 }
end

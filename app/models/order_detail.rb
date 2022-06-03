class OrderDetail < ApplicationRecord
  belongs_to :order
  has_one :product

  validates :qty, :numericality => { :greater_than_or_equal_to => 0 }
  validates :price, :numericality => { :greater_than_or_equal_to => 0 }
  validates :prescription_number, format: { with: /^РЛ\d{6}$/, message: "Укажіть коректний номер рецепта, н.п. РЛ123456", :multiline => true},
            if: -> { Product.find(self.product_id).required_prescription }
end

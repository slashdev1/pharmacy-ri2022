class Stock < ApplicationRecord
  self.table_name = "stock"

  belongs_to :product

  validates :product_id, presence: true
end

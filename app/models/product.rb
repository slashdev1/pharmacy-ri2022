class Product < ApplicationRecord
  enum for_adult_children: [ :for_adult, :for_children ]

  has_many :order_detail

  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 300 }
  validates :price, :numericality => { :greater_than_or_equal_to => 0 }
  validates :for_adult_children, inclusion: { in: Product.for_adult_children.keys }

  scope :on_stock, -> { joins('INNER JOIN stock ON products.id = stock.product_id')
                          .where('stock.qty - stock.reserve_qty > 0') }
  scope :with_stock, -> { joins('LEFT JOIN stock ON products.id = stock.product_id')
                            .select('products.*, coalesce(stock.qty, 0) - coalesce(stock.reserve_qty, 0) available_qty') }
  scope :ordered_by_name, -> { order(name: :asc) }
  scope :require_prescription, -> { where(required_prescription: true) }

  def self.get_for_adult_children_array
    for_adult_children.map {|key, value| [key.titleize, Product.for_adult_children.key(value)]}
  end
end

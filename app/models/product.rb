class Product < ApplicationRecord
  enum for_adult_children: [ :for_adult, :for_children ]

  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 300 }
  validates :price, :numericality => { :greater_than_or_equal_to => 0 }
  validates :for_adult_children, inclusion: { in: Product.for_adult_children.keys }#[0, 1]


  def self.get_for_adult_children_array
    for_adult_children.map {|key, value| [key.titleize, Product.for_adult_children.key(value)]}
  end
end

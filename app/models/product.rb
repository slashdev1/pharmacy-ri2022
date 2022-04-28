class Product < ApplicationRecord
  #enum for_adult_children: [:for_adult, :for_children]
  enum for_adult_children: {:for_adult=>0, :for_children=>1}

  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 300 }
  validates :price, :numericality => { :greater_than_or_equal_to => 0 }
  validates :for_adult_children, inclusion: { in: self.for_adult_children }#[0, 1]
end

class Prescription < ApplicationRecord
  enum for_adult_children: [ :for_adult, :for_children ]

  belongs_to :doctor, class_name: 'User'
  has_one :product

  validates :number, presence: true, uniqueness: true, format: { with: /РЛ\d{6}/, message: "внесите корректный номер рецепта, н.п.РЛ123456"}
  validates :for_adult_children, inclusion: { in: Prescription.for_adult_children.keys }
end

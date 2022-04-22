class Prescription < ApplicationRecord
  belongs_to :user
  has_one :product

  validates :number, presence: true, uniqueness: true, format: { with: /РЛ\d{6}/, message: "внесите корректный номер рецепта, н.п.РЛ123456"}
  validates :for_adult_children, presence: true, inclusion: { in: [0, 1], allow_blank: false, message: "выберите Для детей/Для взрослых." }
end

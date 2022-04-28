class Prescription < ApplicationRecord
  enum for_adult_children: {:for_adult=>0, :for_children=>1}

  belongs_to :user
  has_one :product

  validates :number, presence: true, uniqueness: true, format: { with: /РЛ\d{6}/, message: "внесите корректный номер рецепта, н.п.РЛ123456"}
  validates :for_adult_children, presence: true, inclusion: { in: [0, 1], allow_blank: false, message: "выберите Для детей/Для взрослых." }
end

class Prescription < ApplicationRecord
  enum for_adult_children: [ :for_adult, :for_children ]

  belongs_to :doctor, class_name: 'User'
  has_one :product

  validates :number, presence: true, uniqueness: true, format: { with: /^РЛ\d{6}$/, message: "Укажіть коректний номер рецепта, н.п.РЛ123456", :multiline => true}
  validates :for_adult_children, inclusion: { in: Prescription.for_adult_children.keys }
  validate :expiry_date_is_in_the_future

  def expiry_date_is_in_the_future
    if !expiry_date.present? || expiry_date <= Date.today
      errors.add(:expiry_date, "Укажіть коректний термін придатності.")
    end
  end
end

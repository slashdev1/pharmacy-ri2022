class OrderStatus < ApplicationRecord
  has_many :order

  validates :name, presence: true, uniqueness: true

  def self.get_prepared_status_id
    OrderStatus.find_by(name: 'Підготовлений').id
  end

  def self.get_reject_status_id
    OrderStatus.find_by(name: 'Відхилений').id
  end

  def self.get_done_status_id
    OrderStatus.find_by(name: 'Виконаний').id
  end
end

class Order < ApplicationRecord
  belongs_to :user
  has_one :order_status
  has_many :order_details, dependent: :destroy
  accepts_nested_attributes_for :order_details #, reject_if: :all_blank

  validates :user_id, presence: true
  validates :order_status_id, presence: true
  validates :amount, :numericality => { :greater_than_or_equal_to => 0 }

  scope :prepared, -> { where(order_status_id: OrderStatus.get_prepared_status_id) }
  scope :not_prepared, -> { where.not(order_status_id: OrderStatus.get_prepared_status_id) }
  scope :ordered_by_date, -> { order(created_at: :asc) }

  def is_prepered?
    order_status_id == OrderStatus.get_prepared_status_id
  end

  def is_rejected?
    order_status_id == OrderStatus.get_reject_status_id
  end
end

class User < ApplicationRecord
  has_one :role
  has_many :order

  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 100 }
  validates :role_id, presence: true # todo: do check by ids in table roles 
end

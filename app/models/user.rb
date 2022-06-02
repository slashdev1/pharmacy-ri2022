class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum roles: [ :user, :pharmacist, :doctor ]

  has_many :order

  scope :is_doctor, -> { where(role: roles[:doctor]) }

  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 100 }
  validates :email, presence: true, uniqueness: true
  validates :role, inclusion: { in: User.roles.map {|k,v| v} }

  def is_doctor?
    role == User.roles[:doctor]
  end

  def is_pharmacist?
    role == User.roles[:pharmacist]
  end

  def is_admin?
    admin == true
  end

  def author?(record)
    self == record.user
  end

  def self.get_roles_array
    roles.map {|key, value| [key.titleize, value]}
  end
end

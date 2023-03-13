class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  # validation
  validates :f_name, presence: true, length: { maximum: 50 }
  validates :email, presence: true
  validates :password, presence: true

  # Associations
  has_many :houses
  has_many :reservations
end

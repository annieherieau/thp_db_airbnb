class User < ApplicationRecord
  has_many :owned_houses, foreign_key: 'owner', class_name: "House"
  has_many :reserved_houses, foreign_key: 'customer', class_name: "Reservation"

  #validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
    validates :phone, presence: true
end

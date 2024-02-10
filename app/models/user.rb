class User < ApplicationRecord
  has_many :owned_listings, foreign_key: 'owner', class_name: "Listing"
  has_many :booked_listings, foreign_key: 'guest', class_name: "Reservation"

  #validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "please enter a valid email" }
  validates :phone,
    presence: true,
    uniqueness: true
    

    before_validation :is_valid_phone

    def is_valid_phone
      true
      # format: { with: /(33|0)(6|7|9)\d{8}$/, message: "please enter a valid french phone" }
    end
end

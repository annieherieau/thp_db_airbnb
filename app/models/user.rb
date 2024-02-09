class User < ApplicationRecord
  has_many :owned_houses, foreign_key: 'owner', class_name: "House"
  # has_many :reserved_houses, foreign_key: 'customer_id', class_name: "Reservation"
end

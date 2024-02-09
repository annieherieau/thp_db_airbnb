class Reservation < ApplicationRecord
  belongs_to :customer, class_name: "User", optional: false
  belongs_to :house, optional: false

  # validations
  validates :start_date, presence: true
  validates :duration_in_night, presence: true
  validates :house, presence: true
  validates :customer, presence: true

  attr_accessor :total_price
  ## Attributs
  # prix calculé

  # 
end

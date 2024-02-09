class Reservation < ApplicationRecord
  belongs_to :customer, class_name: "User", optional: false
  belongs_to :house, optional: false

  # validations
  validates :start_date, presence: true
  validates :duration_in_night, presence: true
  validates :house, presence: true
  validates :customer, presence: true

  # Callback
  

  # methodes
  def end_date
    self.start_date + self.duration_in_night * 86400
  end

  def is_already_booked?(date)
    date >= self.start_date && date <= self.end_date
  end

  # Pris totla de la réservation
  def total_price
    self.house.price_per_night * duration_in_night
  end

end

class Listing < ApplicationRecord
  belongs_to :city, optional: false
  belongs_to :owner, class_name: "User", optional: false
  has_many :reservations

  # validations
  validates :available_beds, presence: true
  validates :description, presence:true
  validates :welcome_message, presence:true
  validates :price, presence: true
  validates :city, presence: true
  validates :owner, presence: true

  # renvoi un array des jours de la période de réservation
  def get_booked_period(date, duration)
    period = []
    duration.times do |i|
      period << date + i #* 86400 # 86400s = 1 jour
    end
    return period
  end

  # Vérifier si l'Accommodation est réservée
  def is_already_booked?(date, duration)
    booked = false
    reservation_period = get_booked_period(date, duration) # array

    self.reservations.each do |r|
      period = get_booked_period(r.start_date, r.duration) # array
      period.each do |d|
        reservation_period.each do |rd|
          if rd == d
            booked = true
            break
          end
        end
        break if booked
      end
      break if booked
    end
    return booked
  end

end
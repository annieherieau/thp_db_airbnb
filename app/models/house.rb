class House < ApplicationRecord
  belongs_to :city, optional: false
  belongs_to :owner, class_name: "User", optional: false
  has_many :reservations

  # validations
  validates :number_of_beds, presence: true
  validates :price_per_night, presence: true
  validates :city, presence: true
  validates :owner, presence: true

  # Vérifier si la house est réservée
  def is_already_booked?(date)
  #  self.reservations.each_with_index do |r , i|
  #   date >= self.start_date && date <= self.end_date
  # end
  end

end

class House < ApplicationRecord
  belongs_to :city, optional: false
  belongs_to :owner, class_name: "User", optional: false
  has_many :reservations

  # validations
  validates :number_of_beds, presence: true
  validates :price_per_night, presence: true
  validates :have_wifi, presence: true
  validates :city, presence: true
  validates :owner, presence: true

end

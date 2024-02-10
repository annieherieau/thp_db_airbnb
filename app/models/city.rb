class City < ApplicationRecord
  has_many :listings

  # Validations
  validates :name, presence: true
  validates :zip_code, presence: true, uniqueness: true

end

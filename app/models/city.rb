class City < ApplicationRecord
  has_many :houses

  # Validations
  validates :name, presence: true
end

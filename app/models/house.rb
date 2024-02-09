class House < ApplicationRecord
  belongs_to :city, optional: false
  belongs_to :owner, class_name: "User", optional: false
  has_many :reservations

end

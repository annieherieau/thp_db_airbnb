class Reservation < ApplicationRecord
  belongs_to :customer, class_name: "User", optional: false
  belongs_to :house, optional: false

  ## Attributs
  # prix calculé

  # 
end

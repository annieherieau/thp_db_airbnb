class House < ApplicationRecord
  belongs_to :city, optional: false
  
end

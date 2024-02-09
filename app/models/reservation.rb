class Reservation < ApplicationRecord
  belongs_to :guest, class_name: "User", optional: false
  belongs_to :house, optional: false

  # validations
  validates :start_date, presence: true
  validates :duration_in_night, presence: true
  validates :house, presence: true
  validates :guest, presence: true

  # Callback
  before_validation :is_available_for_booking?
  before_create :confirm_paiement
  after_create :send_welcome_message
  

  # calcul de la date de fin
  def end_date
    self.start_date + self.duration_in_night * 86400
  end

  # Calcule du prix total de la réservation
  def total_price
    self.house.price_per_night * duration_in_night
  end

  # confirmer le paiement pour enregitrer dans la db
  def confirm_paiement
    puts "Prixdu séjour #{self.total_price}€. Confirmez-vous le paiement? [y]"
    throw :abort unless gets.chomp == 'y'  
  end

  # envoyer un message de bienvenue
  def send_welcome_message
    puts "Bienvenue de votre nouvelle Location: livret d'accueil"
  end
  
  def is_available_for_booking?
    true
  end

end

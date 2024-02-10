class Reservation < ApplicationRecord
  belongs_to :guest, class_name: "User", optional: false
  belongs_to :listing, optional: false

  # validations
  validates :start_date, presence: true
  validates_comparison_of :end_date, greater_than: :start_date, presence: true
  validates :listing, presence: true
  validates :guest, presence: true

  # Callback
  before_create :title
  before_create :is_available_for_booking?
  # before_create :confirm_paiement
  after_create :send_welcome_message

  def duration
    ((self.end_date - self.start_date).to_i)/86400
  end

  # Calcule du prix total de la réservation (à zero si c'est le owner)
  def total_price
    return 0.00 if self.listing.owner == self.guest
    (self.listing.price * duration).round(2)
  end

  # reservation title
  def title
    puts '-'*5
    puts "** Res_#{Reservation.all.count+1} Listing n°#{self.listing_id} du #{self.start_date} au #{self.end_date} (#{self.duration} nuit(s))"
  end

  # confirmer le paiement pour enregitrer dans la db
  def confirm_paiement
     puts "Prix du séjour #{self.total_price} €. Confirmez-vous le paiement? [y]"
     throw :abort unless gets.chomp == 'y'
  end

  # envoyer un message de bienvenue
  def send_welcome_message
    puts "Bienvenue Location n°#{self.id}" 
    puts '-'*5
  end
  
  # check si la listing est disponible à la location
  def is_available_for_booking?
    while self.listing.is_already_booked?(self.start_date, self.duration)
      puts "La location n'est pas disponible à cette période."
      puts "Veuillez renseigner une nouvelle date : "
      self.start_date = gets.chomp
    end
  end

  

end

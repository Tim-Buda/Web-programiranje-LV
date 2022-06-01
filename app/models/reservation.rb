class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :apartment
  validates_presence_of :date_from, :date_to
  validate :check_date_range

  def self.reserved_dates(apartment_id)
    dates = []
    Reservation.where(apartment_id: apartment_id).each do |reservation|
      dates << (reservation.date_from..reservation.date_to).to_a
    end
    return dates
  end
  
  def check_date_range
    if self.date_from > self.date_to
      errors.add(:date_from, "Datum mora biti pravilno unešen")
    end
  end
end

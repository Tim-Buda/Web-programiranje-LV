# == Schema Information
#
# Table name: reservations
#
#  id           :bigint           not null, primary key
#  date_from    :date
#  date_to      :date
#  user_id      :bigint           not null
#  apartment_id :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  is_approved  :boolean          default(FALSE)
#
class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :apartment
  validates_presence_of :date_from, :date_to
  validate :check_date_range
  validate :check_overlaping_dates

  def self.reserved_dates(apartment_id)
    dates = []
    Reservation.where(apartment_id: apartment_id).each do |reservation|
      dates << (reservation.date_from..reservation.date_to).to_a
    end
    return dates
  end
  
  def check_date_range
    if self.date_from && self.date_to
      if self.date_from > self.date_to
        errors.add(:date_from, "Datum mora biti pravilno unešen")
      end
      if self.date_from < Date.today
        errors.add(:date_from, "Datum mora biti veći od današnjeg datuma")
      end
      if (self.date_to.mjd - self.date_from.mjd) < 4
        errors.add(:date_from, "Minimalna rezervacija je 4 noćenja")
      end
    end
  end

  def approve
    self.update(is_approved: true)
  end

  def check_overlaping_dates
    dates = Reservation.where(apartment_id: self.apartment_id, is_approved: true)
    dates.each do |date|
        if date_overlaps?(date)
            errors.add(:date_to, "Datum se preklapa sa postojećom rezervacijom")
        end
    end
  end

  def date_overlaps?(other)
    if self.date_from && self.date_to
      self.date_from <= other.date_to && other.date_from <= self.date_to
    end
  end
end

class Table < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations

  # def self.search(guests, day, time)
  #   Table.joins(:reservations).where('cast(seating_capacity as text) >= ? AND reservations.date != ?', guests, day).where.not('starts_at >= ? AND ends_at <= ?', time, time)
  # end

  # def self.search(guests, day, time)
  #   Table.joins(:reservations).where('cast(seating_capacity as text) >= ? AND reservations.date = ?', guests, day).where.not('reservations.date <= ? AND reservations.ends_at >= ?', day, day)
  # end

  def self.search(guests, day, time)
    Reservation.joins(:table).where('cast(seating_capacity as text) >= ? AND reservations.date = ?', guests, day)
  end

  # def self.search(guests)
  #   where('cast(seating_capacity as text) >= ?', guests)
  # end
end

class Reservation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :table, optional: true

  scope :number_of_guests, -> (guests) { joins(:table).where('tables.seating_capacity >= ?', guests)}

  def self.on(day, time)
    requested_start = (time.to_time + 45.minutes).strftime('%T')
    where('date = ? AND starts_at <= ? AND ends_at > ?', day, requested_start, time)
  end
end

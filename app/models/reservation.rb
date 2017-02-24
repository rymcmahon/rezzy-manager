class Reservation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :table, optional: true

  # scope :on, lambda {|day, time| where('date = ? AND starts_at <= ? AND ends_at > ?', day, time, time) }
  # scope :on, lambda { |day| where('date = ?', day) }
  # scope :at, lambda { |time| where('starts_at <= ? AND ends_at > ?', time, time) }
  # scope :on, -> (day, time) { where('date = ? AND starts_at <= ? AND ends_at > ?', day, time, time)}
  # scope :guests, -> (guests) { where('cast(seating_capacity as text) >= ?', guests)}
  scope :number_of_guests, -> (guests) { joins(:table).where('tables.seating_capacity >= ?', guests)}
  def self.on(day, time)
    where('date = ? AND starts_at <= ? AND ends_at > ?', day, time, time)
  end
end

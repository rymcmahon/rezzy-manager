class Reservation < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :table, optional: true

  scope :on, lambda {|day, time| where('date = ? AND starts_at <= ? AND ends_at > ?', day, time, time) }
  # scope :on, lambda { |day| where('date = ?', day) }
  # scope :at, lambda { |time| where('starts_at <= ? AND ends_at > ?', time, time) }
end

class Table < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations

  def self.search(guests)
    where('cast(seating_capacity as text) ILIKE ?', "%#{guests}%")
  end
end

class Table < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations

  def self.search(search)
    where('cast(seating_capacity as text) ILIKE ?', "%#{search}%")
  end
end

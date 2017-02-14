class Table < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations

  def self.search(guests)
    Table.joins(:reservations).where('cast(seating_capacity as text) >= ? AND reservations.table_id = 1', guests)
  end
end

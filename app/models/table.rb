class Table < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations

  def self.free_on(guests, day, time)
    reserved_table_ids = Reservation.on(day, time).number_of_guests(guests).pluck('DISTINCT table_id')
    if reserved_table_ids.empty?
      Table.where('seating_capacity >= ?', guests).pluck('DISTINCT id').sort.first
    else
      Table.where('id NOT IN (?) AND seating_capacity >= ?', reserved_table_ids, guests).pluck('DISTINCT id').sort.first
    end
  end

  def self.reserved_on(guests, day, time)
    reserved_table_ids = Reservation.on(day, time).number_of_guests(guests).pluck('DISTINCT table_id')
    where(id: reserved_table_ids)
  end
end

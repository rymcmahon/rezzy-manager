class Table < ApplicationRecord
  has_many :reservations
  has_many :users, through: :reservations

  # def self.free_on(day, time)
  #   reserved_table_ids = Reservation.on(day, time).pluck('DISTINCT table_id')
  #   where('id NOT IN (?)', reserved_table_ids)
  # end
  #
  # def self.reserved_on(day, time)
  #   reserved_table_ids = Reservation.on(day, time).pluck('DISTINCT table_id')
  #   where(:id => reserved_table_ids)
  # end

  # def self.free_on(day, time)
  #   reserved_table_ids = Reservation.on(day, time).pluck('DISTINCT table_id')
  #   if reserved_table_ids
  #   where.not(id: reserved_table_ids)
  # else
  #   all
  # end
  # end
  # def self.number_of_guests(guests)
  #   where('cast(seating_capacity as text) >=', guests)
  # end


  def self.free_on(guests, day, time)
    reserved_table_ids = Reservation.on(day, time).number_of_guests(guests).pluck('DISTINCT table_id')
    # reserved_table_ids ? where.not(id: reserved_table_ids) : all
    if reserved_table_ids.empty?
      Table.where('seating_capacity >= ?', guests).pluck('DISTINCT id')
    else
      Table.where('id NOT IN (?) AND seating_capacity >= ?', reserved_table_ids, guests)
    end

    # reserved_table_ids ? where('id != ? AND seating_capacity < ?', reserved_table_ids, guests) : all
    # open_table_ids ? where.not(id: open_table_ids) : Table.where('seating_capacity >= ?', guests)
    # open_table_ids ? where.not(id: open_table_ids) : all

  end

  def self.reserved_on(guests, day, time)
    reserved_table_ids = Reservation.on(day, time).number_of_guests(guests).pluck('DISTINCT table_id')
    where(id: reserved_table_ids)
  end
end

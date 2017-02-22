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

  def self.free_on(day, time)
    reserved_table_ids = Reservation.on(day, time).pluck('DISTINCT table_id')
    where('id NOT IN (?)', reserved_table_ids)
  end

  def self.reserved_on(day, time)
    reserved_table_ids = Reservation.on(day, time).pluck('DISTINCT table_id')
    where(:id => reserved_table_ids)
  end
end

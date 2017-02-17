class ChangeDateToDatetimeInReservations < ActiveRecord::Migration[5.0]
  def up
    change_column :reservations, :date, :datetime
  end

  def down
    change_column :reservations, :date, :date
  end
end

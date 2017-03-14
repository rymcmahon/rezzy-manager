class AddArrivedToReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :arrived, :boolean, default: false
  end
end

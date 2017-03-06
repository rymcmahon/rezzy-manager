class AddDinersToReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :diners, :integer
  end
end

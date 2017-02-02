class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.belongs_to :user, index: true
      t.belongs_to :table, index: true
      t.date :date
      t.time :starts_at
      t.time :ends_at
      t.timestamps
    end
  end
end

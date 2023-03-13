class AddHousesRefToReservations < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservations, :house, null: false, foreign_key: true
  end
end

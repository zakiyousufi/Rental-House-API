class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.date :from_date
      t.date :to_date
      t.integer :number_of_persons

      t.timestamps
    end
  end
end

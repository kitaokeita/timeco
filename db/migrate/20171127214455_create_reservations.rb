class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.datetime :startdate
      t.datetime :enddate
      t.string :approval

      t.timestamps
    end
  end
end

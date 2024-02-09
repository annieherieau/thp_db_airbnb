class CreateReservations < ActiveRecord::Migration[7.1]
  def change
    create_table :reservations do |t|
      t.datetime :start_date
      t.integer :duration_in_night
      t.references :guest, index: true
      t.belongs_to :house, index: true


      t.timestamps
    end
  end
end

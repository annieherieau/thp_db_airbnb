class CreateHouses < ActiveRecord::Migration[7.1]
  def change
    create_table :houses do |t|
      t.integer :number_of_beds
      t.float :night_price
      t.text :description
      t.boolean :have_wifi
      t.belongs_to :city, index: true

      t.timestamps
    end
  end
end

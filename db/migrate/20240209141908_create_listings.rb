class CreateListings < ActiveRecord::Migration[7.1]
  def change
    create_table :listings do |t|
      t.integer :available_beds
      t.float :price
      t.text :description
      t.text :welcome_message
      t.boolean :has_wifi
      t.belongs_to :city, index: true

      t.timestamps
    end
  end
end

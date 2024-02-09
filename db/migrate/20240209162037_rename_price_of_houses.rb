class RenamePriceOfHouses < ActiveRecord::Migration[7.1]
  def change
    rename_column(:houses, :night_price, :price_per_night)
  end
end

class AddReferencesToHouse < ActiveRecord::Migration[7.1]
  def change
    add_reference :houses, :owner, foreign_key: { to_table: :users }
  end
end

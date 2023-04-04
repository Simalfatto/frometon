class AddCoordinatesToCheeses < ActiveRecord::Migration[7.0]
  def change
    add_column :cheeses, :latitude, :float
    add_column :cheeses, :longitude, :float
    add_column :cheeses, :region, :string
  end
end

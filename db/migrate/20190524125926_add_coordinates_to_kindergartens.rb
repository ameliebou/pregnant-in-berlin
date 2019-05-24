class AddCoordinatesToKindergartens < ActiveRecord::Migration[5.2]
  def change
    add_column :kindergartens, :latitude, :float
    add_column :kindergartens, :longitude, :float
  end
end

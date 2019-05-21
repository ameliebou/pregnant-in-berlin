class CreateFavoriteKindergartens < ActiveRecord::Migration[5.2]
  def change
    create_table :favorite_kindergartens do |t|

      t.timestamps
    end
  end
end

class CreateKita < ActiveRecord::Migration[5.2]
  def change
    create_table :kita do |t|
      t.string :name
      t.text :address
      t.string :phone_number
      t.string :email
      t.integer :places
      t.integer :places_under_three
      t.integer :places_over_three
      t.integer :minimum_age

      t.timestamps
    end
  end
end

class AddDuedateToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :duedate, :date
  end
end

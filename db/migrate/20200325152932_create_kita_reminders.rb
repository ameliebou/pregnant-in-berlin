class CreateKitaReminders < ActiveRecord::Migration[5.2]
  def change
    create_table :kita_reminders do |t|
      t.string :title
      t.text :content
      t.datetime :date
      t.references :user, foreign_key: true
      t.references :kindergarten, foreign_key: true

      t.timestamps
    end
  end
end

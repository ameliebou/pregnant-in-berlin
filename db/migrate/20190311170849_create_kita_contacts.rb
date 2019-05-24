class CreateKitaContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :kita_contacts do |t|
      t.datetime :date
      t.string :type
      t.text :note

      t.timestamps
    end
  end
end

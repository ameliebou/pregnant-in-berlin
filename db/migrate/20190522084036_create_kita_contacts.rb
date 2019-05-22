class CreateKitaContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :kita_contacts do |t|
      t.string :contact_type
      t.text :note
      t.references :user, foreign_key: true
      t.references :kindergarten, foreign_key: true

      t.timestamps
    end
  end
end

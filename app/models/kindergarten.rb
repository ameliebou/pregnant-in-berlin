class Kindergarten < ApplicationRecord
  has_many :kita_contacts
  has_many :kita_reminders

  geocoded_by :address
end

class Kindergarten < ApplicationRecord
  has_many :kita_contacts
  has_many :favorite_kindergartens

  geocoded_by :address
end

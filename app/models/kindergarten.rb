class Kindergarten < ApplicationRecord
  has_many :kita_contacts

  geocoded_by :address
  after_validation :geocode
end

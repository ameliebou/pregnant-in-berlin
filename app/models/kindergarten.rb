class Kindergarten < ApplicationRecord
  has_many :kita_contacts

  geocoded_by :address
end

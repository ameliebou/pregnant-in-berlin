class Kita < ApplicationRecord
  has_many :kita_contacts

  validates :name, presence: true
end

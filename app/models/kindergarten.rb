class Kindergarten < ApplicationRecord
  has_many :kita_contacts
  has_many :kita_reminders

  geocoded_by :address

  def num_reminders
    kita_reminders.count_reminders
  end
end

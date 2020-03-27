class Kindergarten < ApplicationRecord
  has_many :kita_contacts
  has_many :kita_reminders

  geocoded_by :address

  def count_reminders(current_user)
    kita_reminders.coming(current_user).count
  end
end

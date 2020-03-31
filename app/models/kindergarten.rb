class Kindergarten < ApplicationRecord
  has_many :kita_contacts
  has_many :kita_reminders

  geocoded_by :address

  def num_reminders(current_user)
    kita_reminders.count_reminders(current_user)
  end

  def any_reminder_today?(current_user)
    kita_reminders.any_today?(current_user)
  end
end

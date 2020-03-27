class KitaReminder < ApplicationRecord
  belongs_to :user
  belongs_to :kindergarten

  def self.count_reminders
    KitaReminder.where("date > ?", Time.now).count
  end

  def self.coming(current_user)
    KitaReminder.where(user: current_user).where("date > ?", Time.now).order(date: :asc)
  end

  def check_day(days)
    if days == 0
      "Today, in"
    elsif days == 1
      "Tomorrow, in"
    else
      "In #{days} days,"
    end
  end

  def count_down_formatted(days, hours, min_left, min)
    return "In #{min} minute(s)!" if min < 60
    days = check_day(days)
    if hours > 0
      "#{days} #{hours} hour(s) and #{min_left} minute(s)"
    else
      "#{days} and #{min_left} minute(s)"
    end
  end

  def count_down
    min = (date.to_time - Time.now).to_i / 60
    days = min / 1440
    min_left = min % 1440
    hours = min_left / 60
    min_left = min_left % 60
    count_down_formatted(days, hours, min_left, min)
  end
end

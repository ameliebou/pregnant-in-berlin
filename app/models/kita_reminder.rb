class KitaReminder < ApplicationRecord
  belongs_to :user
  belongs_to :kindergarten
end

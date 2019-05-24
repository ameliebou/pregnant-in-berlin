class KitaContact < ApplicationRecord
  belongs_to :user
  belongs_to :kindergarten

  validates :contact_type, inclusion: { in: %w(call email visit other) }
end

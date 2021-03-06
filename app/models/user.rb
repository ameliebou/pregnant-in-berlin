class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :kita_contacts, dependent: :destroy
  has_many :kita_reminders, dependent: :destroy
  has_many :kindergartens, through: :kita_contacts
end

class PagesController < ApplicationController
  skip_before_action :authenticate_user!#, only: [:home, :kitas, :about, :midwives]

  def dashboard
    @kita_contacts = KitaContact.all.where(user: current_user)
    @kita_reminders = KitaReminder.all.where(user: current_user)
    @kitas = []
    @kita_contacts.each { |kc| @kitas << kc.kindergarten }
    @kitas.uniq!
    @kitas.sort!
    @markers = @kitas.map do |kita|
      {
        details: {
          contacts: kita.kita_contacts.where(user: current_user)
        },
        lng: kita.longitude,
        lat: kita.latitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { kindergarten: kita })
      }
    end
  end
end

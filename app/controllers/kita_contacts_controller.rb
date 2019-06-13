class KitaContactsController < ApplicationController
  before_action :set_kita
  skip_before_action :set_kita, only: :index

  def index
    @kita_contacts = KitaContact.all.where(user: current_user)
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

  def new
    @kita_contact = KitaContact.new
  end

  def create
    @kita_contact = KitaContact.new(kita_contact_params)
    @kita_contact.kindergarten = @kita
    @kita_contact.user = current_user
    @kita_contact.save!
    redirect_to kindergarten_path(@kita)
  end

  private

  def set_kita
    @kita = Kindergarten.find(params[:kindergarten_id])
  end

  def kita_contact_params
    params.require(:kita_contact).permit(:contact_type, :note)
  end
end

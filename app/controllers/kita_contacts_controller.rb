class KitaContactsController < ApplicationController
  before_action :set_kita, only: :create
  before_action :set_kita_contact, only: [:destroy, :update]

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

  def create
    @kita_contact = KitaContact.new(kita_contact_params)
    @kita_contact.kindergarten = @kita
    @kita_contact.user = current_user
    @kita_contact.save!
    redirect_to kindergarten_path(@kita)
  end

  def update
    @kita_contact.update(update_kita_contact_params)
    redirect_to kindergarten_path(@kita_contact.kindergarten)
  end

  def destroy
    @kita_contact.destroy
    redirect_to kindergarten_path(@kita_contact.kindergarten)
  end

  private

  def set_kita
    @kita = Kindergarten.find(params[:kindergarten_id])
  end

  def set_kita_contact
    @kita_contact = KitaContact.find(params[:id])
  end

  def kita_contact_params
    params.require(:kita_contact).permit(:contact_type, :note)
  end

  def update_kita_contact_params
    params.require(:kita_contact).permit(:contact_type, :note, :created_at)
  end
end

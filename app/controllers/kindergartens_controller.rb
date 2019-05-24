class KindergartensController < ApplicationController
  def index
    if params[:address].present?
      @kindergartens = Kindergarten.near(params[:address], params[:radius])
    else
      @kindergartens = Kindergarten.where.not(latitude: nil, longitude: nil)
    end
    @markers = @kindergartens.map do |kindergarten|
      {
        lng: kindergarten.longitude,
        lat: kindergarten.latitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { kindergarten: kindergarten })
      }
    end
  end

  def show
    @kindergarten = Kindergarten.find(params[:id])
    @kita_contacts = @kindergarten.kita_contacts.order(created_at: :desc)
    @kita_contact = KitaContact.new
    @markers = [{
      lng: @kindergarten.longitude,
      lat: @kindergarten.latitude
    }]
  end
end

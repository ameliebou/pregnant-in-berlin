class KindergartensController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def get_minimum_age
    return @kindergartens = @kindergartens if params[:minimum_age] == 'all'
    @kindergartens = @kindergartens.where('minimum_age <= ?', params[:minimum_age])
  end

  def get_places
    case params[:places]
    when 'all'
      @kindergartens = @kindergartens
    when '< 20'
      @kindergartens = @kindergartens.where('places < ?', 20)
    when '20 - 50'
      @kindergartens = @kindergartens.where('places >= ?', 20).where('places < ?', 50)
    when '50 - 100'
      @kindergartens = @kindergartens.where('places >= ?', 50).where('places < ?', 100)
    when '> 100'
      @kindergartens = @kindergartens.where('places >= 100', 6)
    end
  end

  def index
    if params[:address].present?
      address = params[:address] + " Berlin"
      params[:radius].present? ? radius = params[:radius] : radius = 2
      @kindergartens = Kindergarten.near(address, radius)
      get_minimum_age
      get_places
    else
      @kindergartens = Kindergarten.where.not(latitude: nil, longitude: nil)
    end
    @markers = @kindergartens.map do |kindergarten|
      {
        details: {
          contacts: kindergarten.kita_contacts.where(user: current_user)
        },
        lng: kindergarten.longitude,
        lat: kindergarten.latitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { kindergarten: kindergarten })
      }
    end
  end

  def show
    @kindergarten = Kindergarten.find(params[:id])
    @kita_contacts = @kindergarten.kita_contacts.where(user: current_user).order(created_at: :desc)
    @kita_contact = KitaContact.new
    @kita_reminder = KitaReminder.new
    @markers = [{
      details: {
        contacts: @kindergarten.kita_contacts.where(user: current_user)
      },
      lng: @kindergarten.longitude,
      lat: @kindergarten.latitude,
      infoWindow: render_to_string(partial: "infowindow", locals: { kindergarten: @kindergarten })
    }]
  end
end

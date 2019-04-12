class KindergartensController < ApplicationController
  def index
    @kindergartens = Kindergarten.where.not(latitude: nil, longitude: nil)
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
    @markers = [{
      lng: @kindergarten.longitude,
      lat: @kindergarten.latitude
    }]
  end
end

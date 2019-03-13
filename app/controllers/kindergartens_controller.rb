class KindergartensController < ApplicationController
  def index
    @kindergartens = Kindergarten.where.not(latitude: nil, longitude: nil)
    @markers = @kindergartens.map do |kindergarten|
      {
        lng: kindergarten.longitude,
        lat: kindergarten.latitude
      }
    end
  end

  def show
    @kindergarten = Kindergarten.find(params[:id])
  end
end

class KindergartensController < ApplicationController
  def index
    if params[:address].present? && params[:radius].present?
      @kindergartens = Kindergarten.near(params[:address], params[:radius])
    elsif params[:address].present?
      @kindergartens = Kindergarten.near(params[:address], 2)
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
    @markers = [{
      lng: @kindergarten.longitude,
      lat: @kindergarten.latitude
    }]
  end
end

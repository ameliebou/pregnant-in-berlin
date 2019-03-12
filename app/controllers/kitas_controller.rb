class KidergartensController < ApplicationController
  def index
    @kindergartens = Kindergarten.all
  end

  def show
    @kindergarten = Kindergarten.find(params[:id])
  end
end

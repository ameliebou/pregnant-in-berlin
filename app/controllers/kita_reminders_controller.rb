class KitaRemindersController < ApplicationController
  before_action set_kindergarten

  private

  def set_kindergarten
    @kindergarten = Kindergarten.find(params[:kindergarten_id])
  end
end

class KitaRemindersController < ApplicationController
  before_action :set_kindergarten

  def create
    @kita_reminder = KitaReminder.new(kita_reminder_params)
    @kita_reminder.kindergarten = @kindergarten
    @kita_reminder.user = current_user
    @kita_reminder.save!
    redirect_to kindergarten_path(@kindergarten)
  end

  private

  def set_kindergarten
    @kindergarten = Kindergarten.find(params[:kindergarten_id])
  end

  def kita_reminder_params
    params.require(:kita_reminder).permit(:title, :content, :date)
  end
end

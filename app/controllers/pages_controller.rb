class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :kitas, :about, :midwives]
end

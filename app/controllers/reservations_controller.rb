class ReservationsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @reservations = Reservation.all
  end

  def booked
    @reservation_date = params[:day]
    @reservations = Reservation.where(:date => @reservation_date)
  end
end

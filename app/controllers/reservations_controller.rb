class ReservationsController < ApplicationController
  def index
    @reservations = Reservation.all
  end

  def booked
    @reservation_date = params[:day]
    @reservations = Reservation.where(:date => @reservation_date)
  end
end

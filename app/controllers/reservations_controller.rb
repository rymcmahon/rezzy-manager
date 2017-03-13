class ReservationsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @reservations = Reservation.all
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to '/reservations', alert: 'Reservation Deleted!'
  end


  def booked
    @reservation_date = params[:day]
    @reservations = Reservation.where(:date => @reservation_date)
  end
end

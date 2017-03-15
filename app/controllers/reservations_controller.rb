class ReservationsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @reservations = Reservation.all
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
    @reservation = Reservation.find(params[:id])

      if @reservation.update(reservation_params)
        respond_to do |format|
          format.html { redirect_to 'reservations/', notice: 'Reservation updated!' }
          format.js {}
        end
      else
        render '/reservations', alert: 'Something went awry!'
      end
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

  private
  def reservation_params
    params.require(:reservation).permit(:arrived, :date, :starts_at)
  end
end

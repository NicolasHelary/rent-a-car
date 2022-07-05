class ReservationsController < ApplicationController

  def new
    @reservation = Reservation.new
    @car = Car.find(params[:car_id])
  end

  def create
    @reservation = Reservation.new(reservation_params)
    @car = Car.find(params[:car_id])
    @reservation.car = @car
    @reservation.user = current_user
    if @reservation.save
      redirect_to cars_path
      flash[:alert] = "You sucessfully booked a car, enjoy"
    else
      render :new
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date)
  end
end

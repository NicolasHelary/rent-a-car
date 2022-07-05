class CarsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_car, only: %i[show]
  def index
    @cars = Car.all
    if params[:query].present?
      sql_query = "name ILIKE :query OR brand ILIKE :query"
      @cars = Car.where(sql_query, query: "%#{params[:query]}%")
    else
      @cars = Car.all
    end
  end

  def show
  end

  def new
    @car = Car.new
    @user = current_user
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user
    if @car.save
      redirect_to cars_path
    else
      render :new
    end
  end

  private

  def car_params
    params.require(:car).permit(:name, :brand, :photo)
  end

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:name, :brand, :kilometers, :photo)
  end
end

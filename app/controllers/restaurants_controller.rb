class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]
  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
  end

  def create
    @restaurant = Restaurant.new(restaurant_panams)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_panams
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end

class HomeController < ApplicationController
  def dashboard
  	@restaurant = Restaurant.find(current_user.restaurant_id)
    @items = @restaurant.items
    @orders = @restaurant.orders
  end
end

class HomeController < ApplicationController
  def dashboard
  	if current_user
  		@restaurant = Restaurant.find(current_user.restaurant_id)
 	    @items = @restaurant.items
    	@orders = @restaurant.orders
    else
   	end
  end
end

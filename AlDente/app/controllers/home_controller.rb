class HomeController < ApplicationController
  def dashboard
  	if current_user
  		@restaurant = Restaurant.find(current_user.restaurant_id)
 	    @items = @restaurant.items
    	@unpaid_orders = @restaurant.orders.unpaid
    	@paid_orders = @restaurant.orders.paid
    else
   	end
  end
end

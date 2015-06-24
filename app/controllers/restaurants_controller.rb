class RestaurantsController < ApplicationController

	def index
		@restaurant = Restaurant.all
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		@restaurant = Restaurant.new(params.require(:restaurant).permit(:name, :description, :address, :phone))
		if @restaurant.save
			redirect_to restaurant_url
		else
			render action: "new"
		end
	end

	def edit
		@restaurant = Restaurant.find(params[:id])
	end

	def update
		@restaurant = Restaurant.find(params[:id])

		if @restaurant.update_attributes(params.require(:restaurant).permit(:name, :description, :address, :phone))
			redirect_to restaurants_path
		else
			render action: "edit"
		end
	end

	def show
		@restaurant = Restaurant.find(params[:id])
	end
	
end

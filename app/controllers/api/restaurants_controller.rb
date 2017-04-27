module Api
	class RestaurantsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :get_restaurant, only: [:show, :update, :destroy]

		def index
			@restaurants = Restaurant.all

			render json: @restaurants
		end

		def create
			@restaurant = @user.restaurants.create(permitted_create_params)
			render json: @restaurant
		end

    def show
      render json: @restaurant
    end

    def update
      @restaurant.update(permitted_create_params)
      render json: @restaurant
    end

    def destroy
      Restaurant.destroy(@restaurant.id)
      self.index
    end

		# def approve
		# 	@restaurant = Restaurant.find(params[:id])

		# 	update_attributes(approved_by_id: current_user_id))
	 #  end

		private

    def get_restaurant
      @restaurant = Restaurant.find_by(id: params[:id])

      render json: { error: "restaurant(id:#{params[:id]}) does not exist" } unless @restaurant
    end

		def permitted_create_params
			params.require(:restaurant).permit(:name, :status)
		end

	end
end
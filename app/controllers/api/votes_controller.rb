module Api
  class VotesController < ApplicationController
    def create
      Vote.create(
        user: User.find_by(id: params[:user_id]),
        restaurant: Restaurant.find_by(id: params[:restaurant_id]),
        poll: Poll.find_by(id: params[:poll_id])
      )

      render json: 'hehe'
    end
  end
end

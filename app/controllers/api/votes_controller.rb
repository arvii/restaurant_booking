module Api
  class VotesController < ApplicationController
    def create
      @vote = Vote.create(
        user: User.find_by(id: params[:user_id]),
        restaurant: Restaurant.find_by(id: params[:restaurant_id]),
        poll: Poll.find_by(id: params[:poll_id])
      )
      render json: @vote
    end

    def index
      @votes = Vote.all
      render json: @votes
    end

    def show
      @vote = Vote.find(params[:id])
      render json: @vote
    end

  end
end

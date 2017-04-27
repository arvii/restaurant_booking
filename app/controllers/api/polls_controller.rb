module Api
	class PollsController < ApplicationController
		skip_before_action :verify_authenticity_token
		before_action :get_poll, only: [:show, :update, :destroy]
		
		def index
			@polls = Poll.all
			render json: @polls
		end

		def create
			@poll= @user.polls.create!(permitted_create_params)
			render json: @poll
		end

		def show
			render json: @poll
		end

		def update
			@poll.update!(permitted_create_params)
			render json: @poll
		end

		def destroy
			Poll.destroy(@poll.id)
			self.index
		end

		private

		def get_poll
			@poll = Poll.find_by(id: params[:id])

			render json: { error: "poll(id:#{params[:id]}) does not exist" } unless @poll
		end

		def permitted_create_params
			params.require(:poll).permit(:number_of_people, :budget, :occasion, :status)
		end

	end
end
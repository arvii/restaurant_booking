class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :get_user


	def get_user
		@user = User.find_by(id: params[:user_id])

		render json: { error: "user(id:#{params[:id]}) does not exist" } unless @user
	end
end

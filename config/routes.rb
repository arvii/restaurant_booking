Rails.application.routes.draw do

	 namespace :api do
  	resources :users do
  		resources :polls
  		resources :restaurants do
  			post 'approve'
  		end
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

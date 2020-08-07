Rails.application.routes.draw do

	root to: 'pages#index'

  devise_for :drivers, controllers: {
    sessions: 'drivers/sessions',
    passwords: 'drivers/password',
    registrations: 'drivers/registrations'
  }

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/password',
    registrations: 'users/registrations'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show, :new, :create] 

	resources :drivers, only: [:index, :show, :new, :create] do
    member do
    	get :request_accepts
    end
	end

	resources :request, only: [:index, :new, :create] do
    member do
    	get :request_accept
    end
	end

	resources :request_accept, only: [:create, :destroy]

end

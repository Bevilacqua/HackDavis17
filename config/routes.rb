Rails.application.routes.draw do
	root 'welcome#index'

	resources :groups

	get '/signup' => 'users#new'
	resources :users, only: [:show, :edit, :update, :destroy, :index, :create]
	resources :items

	get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    get '/logout' => 'sessions#destroy'
end

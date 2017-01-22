Rails.application.routes.draw do
	root 'welcome#index'

	resources :groups
	get 'join/via/:join_id', to: 'groups#join', as: "join"

	post '/membership/create', to: 'memberships#create', as: "create_membership"

	get '/signup' => 'users#new'
	resources :users, only: [:show, :edit, :update, :destroy, :index, :create]
	resources :items

	get '/login' => 'sessions#new'
    post '/login' => 'sessions#create'
    get '/logout' => 'sessions#destroy'
end

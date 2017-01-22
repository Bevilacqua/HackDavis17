Rails.application.routes.draw do
	get "/auth/auth0/callback" => "auth0#callback"
	get "/auth/failure" => "auth0#failure"
	root 'welcome#index'

	resources :groups
	resources :users
	resources :items
end

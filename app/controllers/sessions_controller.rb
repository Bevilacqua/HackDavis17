class SessionsController < ApplicationController
	def new
	end

	def create
	    user = User.find_by_email(params[:email])
	    if user && user.authenticate(params[:password])
	      cookies[:user_id] = user.id
	      puts "logging in user" + user.id.to_s
	      redirect_to '/'
	    else
	      redirect_to '/login'
	    end
	end

	def destroy
		cookies.delete :user_id
		redirect_to '/'
	end
end

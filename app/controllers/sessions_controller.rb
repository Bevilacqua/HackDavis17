class SessionsController < ApplicationController
	def new
	end

	def create
	    user = User.find_by_email(params[:email])
	    if user && user.authenticate(params[:password])
	      cookies[:user_id] = { value: user.id, :expires => 1.hour.from_now }
	      puts "logging in user" + user.id.to_s
	      redirect_to current_user
	    else
	      redirect_to '/login'
	    end
	end

	def destroy
		cookies.delete :user_id
		redirect_to '/'
	end
end

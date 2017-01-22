class SessionsController < ApplicationController
	def new
	end

	def create
	    user = User.find_by_email(params[:email])
	    if user && user.authenticate(params[:password])
	      cookies[:user_id] = { value: user.id, :expires => 6.hour.from_now }
	      puts "logging in user" + user.id.to_s

	      if request.url.to_s.include?(root_path)
	      	redirect_to current_user, notice: "You're in!"
	      else
    	  	redirect_back(fallback_location: current_user, subdomain: false, notice: "You're in!")
    	  end
	    else
	      redirect_to login_path(subdomain: false, notice: "You're in!")
	    end
	end

	def destroy
		cookies.delete :user_id
		redirect_to '/'
	end
end

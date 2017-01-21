class Auth0Controller < ApplicationController
  def callback
  	auth_hash = request.env['omniauth.auth']
    puts auth_hash["uid"]
  end

  def failure
  	#TODO
  end
end

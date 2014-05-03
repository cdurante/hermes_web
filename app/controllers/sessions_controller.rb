class SessionsController < ApplicationController
skip_before_action :verify_authenticity_token
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
	sign_in user
	redirect_back_or user
    else
      flash.now[:error] = 'Invalid email/password combination' 
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end

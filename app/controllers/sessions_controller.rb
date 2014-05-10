class SessionsController < ApplicationController

skip_before_action :verify_authenticity_token
  
  def new
  end

  def create

    user = User.find_by_email!(params[:email])

      if user && user.valid_password?(params[:password])
        render json: user
      else
        render json: 'invalid'
      end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
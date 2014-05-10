class SessionsController < ApplicationController

skip_before_action :verify_authenticity_token
  
  def new
  end

  def create

user = User.find_by_email(params[:user][:email])
  
    
    if user && user.valid_password?(params[:user][:password])
    
      respond_to do |format|
        
        format.json{
                render json: user
             }
      end
    else
     
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
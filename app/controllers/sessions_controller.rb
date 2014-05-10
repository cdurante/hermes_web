class SessionsController < ApplicationController

skip_before_action :verify_authenticity_token
  
  def new
  end

  def create

    user = User.find_by(email: params[:email])
    
    if user && user.authenticate(params[:password])
    
      respond_to do |format|
        
        format.json{
  	           sign_in user
                render json: user
             }
      end
    else
     render json: 'unicorn'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end


def sign_in(user)
    self.current_user = user
  end

end

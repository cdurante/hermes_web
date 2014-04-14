class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html show.html.erb
      format.xml { render :xml=> @user}
      format.json {render:json => @user}
    end
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  private

    def user_params
      params.require(:user).permit(:userName, :realName, :dob, :email, :password,
                                   :password_confirmation)
    end
end

class UsersController < ApplicationController
  
  before_action :signed_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
  before_action :correct_user,   only: [:edit, :update]
respond_to 


  def index
    respond_to do |format|

    format.html { @users = User.paginate(page: params[:page])}
    format.xml {render xml: User.all}
    format.json {render json: User.all}
 end
  end

  def show
      @user = User.find(params[:id])
      respond_to do |format|
      format.html
      format.xml { render xml: @user }
      format.json { render json: @user }
      end    
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  def new
    if user_signed_in?
	redirect_to root_path
    else
      @user = User.new
    end
  end

  def create
    if user_signed_in?
      redirect_to root_path
    else
      @user = User.new(user_params)    # Not the final implementation!
      if @user.save
        sign_in @user
        flash[:success] = "Welcome to Hermes!"
        redirect_to @user
      else
        render 'new'
      end
    end
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    if current_user.admin? && User.find(params[:id])==current_user
      flash[:error] = "You cannot delete your own administrative account."
    else
      User.find(params[:id]).destroy
      flash[:success] = "User deleted."
      redirect_to users_url
    end
  end

  private
  
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

def signed_in_user
  unless user_signed_in?
    store_location
          redirect_to new_user_registration_path, notice: "Please sign in."
  end
  end

    def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end

end

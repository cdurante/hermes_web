class RelationshipsController < ApplicationController
  before_action :signed_in_user

  respond_to :html, :js

  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
    respond_with @user
  end

  def destroy
    @user = Relationship.find(params[:id]).followed
    current_user.unfollow!(@user)
    respond_with @user
  end
end

def signed_in_user
  unless signed_in?
    store_location
          redirect_to new_user_session_path, notice: "Please sign in."
  end
  end

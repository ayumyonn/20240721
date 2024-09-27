class ProfilesController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    # @user = User.find(params[:id])
    # @posts = @user.posts
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
    # @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:avatar, :user_name, :email)
  end
end

class ProfilesController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @posts = current_user.posts.includes(:user).order(created_at: :desc) # 投稿を取得
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to profile_path(@user)
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

class ProfilesController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def show
    @posts = @user.posts.includes(:user).order(created_at: :desc) # 投稿を取得

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
    # @user = User.find_by(params[:id])
    @user = User.find(params[:id]) # idを指定してユーザーを取得
  end

  def user_params
    params.require(:user).permit(:avatar, :user_name, :email)
  end
end

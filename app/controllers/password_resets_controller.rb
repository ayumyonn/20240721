class PasswordResetsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user
      @user.send_reset_password_instructions
      redirect_to root_path, notice: 'パスワードリセットのメールを送信しました。'
    else
      flash.now[:alert] = 'ユーザーが見つかりませんでした。'
      render :new
    end
  end

  def edit
    @user = User.find_by(reset_password_token: params[:id])
  end

  def update
    @user = User.find_by(reset_password_token: params[:id])
    if @user.update(user_params)
      redirect_to root_path, notice: 'パスワードがリセットされました。'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end

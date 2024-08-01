class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new; end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    Rails.logger.debug "出力したい内容"
Rails.logger.debug "出力したい内容"
Rails.logger.debug "出力したい内容"
    logout
    redirect_to login_path, status: :see_other
  end
end

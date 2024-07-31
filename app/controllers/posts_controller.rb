class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user)
  end

  def new
    @posts =  Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path
      # success: t('defaults.flash_message.created', item: post.model_name.human)
    else
      # flash.now[:danger] = t('defaults.flash_message.not_created', item: post.model_name.human)
      render :new, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:place_name, :adress, :body, :post_image, :post_image_cache)
  end
end

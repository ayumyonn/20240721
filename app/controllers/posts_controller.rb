class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).all.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success]
      redirect_to posts_path
    else
      flash.now[:danger]
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:place_name, :adress, :body, :post_image, :post_image_cache)
  end

  def find_post
    @post = Post.find_by(id: params[:id])
  end
end

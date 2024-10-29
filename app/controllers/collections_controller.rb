class CollectionsController < ApplicationController
  before_action :require_login

  def index
    @collections = current_user.collections
  end

  def new
    @collection = Collection.new
  end

  def create
    @collection = current_user.collections.build(collection_params)
      if @collection.save
        redirect_to bookmarks_collections_path, notice: 'Collection created successfully.' # ブックマークページにリダイレクト
      else
        render :new
      end
  end

  def show
    @collection = current_user.collections.find(params[:id])
    @bookmarked_posts = @collection.bookmarks.includes(:post)
  end

  def bookmarks
    # @bookmark_posts = Post.all # ここでブックマークの投稿を取得する
    @bookmark_posts = current_user.bookmark_posts.includes(:user).order(created_at: :desc)
    render :bookmarks
  end

  private

  def collection_params
    params.require(:collection).permit(:name)
  end
end

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
      redirect_to collections_path, notice: 'Collection created successfully.'
    else
      render :new
    end
  end

  def show
    @collection = current_user.collections.find(params[:id])
    @bookmarked_posts = @collection.bookmarks.includes(:post)
  end

  private

  def collection_params
    params.require(:collection).permit(:name)
  end
end

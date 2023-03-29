class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.where(user_id: current_user.id)
  end

  def new

    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.user = current_user
    @bookmark.cheese = Cheese.find(params[:cheese_id])
    if @review.save
      redirect_to cheese_path, notice: "Merci pour votre commentaire"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def bookmark_params
    params.require(:booking).permit(:user_id, :cheese_id)
  end
end

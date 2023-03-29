class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.where(user_id: current_user.id)
    @forbiddens = Forbidden.where(user_id: current_user.id)
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new
    @bookmark.user = current_user
    @bookmark.cheese = Cheese.find(params[:cheese_id])
    if @bookmark.save
      redirect_to root_path, notice: "Bien ajouté aux favoris"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def forbidden
    @forbidden = Forbidden.new
    @forbidden.user = current_user
    @forbidden.cheese = Cheese.find(params[:cheese_id])
    if @forbidden.save
      redirect_to root_path, notice: "Bien ajouté aux interdits"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:user_id, :cheese_id)
  end
end

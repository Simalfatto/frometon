class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.includes(cheese: :reviews).where(user_id: current_user.id)
    @forbiddens = Forbidden.where(user_id: current_user.id)
    # @review = Review.joins(cheese: :user).where(users: { id: current_user.id }, cheese: { cheese_id: bookmark.cheese.id })
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new
    @bookmark.user = current_user
    @bookmark.cheese = Cheese.find(params[:cheese_id])
    if @bookmark.save
      redirect_to bookmarks_path, notice: "Bien ajouté à votre liste d'envies, goûtez-le vite !"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def forbidden
    @forbidden = Forbidden.new
    @forbidden.user = current_user
    @forbidden.cheese = Cheese.find(params[:cheese_id])
    if @forbidden.save
      redirect_to bookmarks_path, notice: "Ce fromage n'apparaîtra plus dans vos recherches."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if params[:bookmark_category] == "bookmark"
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy if @bookmark
    else
    @forbidden = Forbidden.find(params[:id])
    @forbidden.destroy
    end
    redirect_to bookmarks_path(bookmark_category: params[:bookmark_category]), notice: "Ce fromage a bien été supprimé de votre liste"
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:user_id, :cheese_id)
  end
end

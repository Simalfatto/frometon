class CheesesController < ApplicationController
  before_action :set_cheese, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [ :show, :index ]

  def index
    if params[:query].present?
      @cheeses = Cheese.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @cheeses = Cheese.all
    end
  end

  def show
    @forbiddens = Forbidden.where(user_id: current_user.id)
    @bookmarks = Bookmark.where(user_id: current_user.id)
    @recipes = Recipe.where(cheese_id: @cheese.id)
  end

  def new
    @cheese = Cheese.new
  end

  private

  def set_cheese
    @cheese = Cheese.find(params[:id])
  end
end

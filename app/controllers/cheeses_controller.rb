class CheesesController < ApplicationController
  before_action :set_cheese, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [ :show, :index ]

  def index
    if params[:region]
      @regions = Cheese.where("region ILIKE ?", "%#{params[:query]}%")
      respond_to do |format|
        format.html
      end
    elsif params[:query].present?
      @cheeses = Cheese.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @cheeses = Cheese.all
    end
  end

  def show
    if current_user
      @forbiddens = Forbidden.where(user_id: current_user.id)
      @bookmarks = Bookmark.where(user_id: current_user.id)
      @recipes = Recipe.where(cheese_id: @cheese.id)
    else
      @recipes = Recipe.where(cheese_id: @cheese.id)
    end
  end

  def new
    @cheese = Cheese.new
  end

  def region
    @cheeses = Cheese.all
    # The `geocoded` scope filters only flats with coordinates
    @markers = @cheeses.geocoded.map do |cheese|
      {
        lat: cheese.latitude,
        lng: cheese.longitude
      }
    end
  end

  private

  def set_cheese
    @cheese = Cheese.find(params[:id])
  end
end

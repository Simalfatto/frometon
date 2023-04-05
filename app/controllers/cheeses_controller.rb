class CheesesController < ApplicationController
  before_action :set_cheese, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [ :show, :index ]

  def index
    if params[:region]
      case params[:region]
      when "Île-de-France"
        @regions = Cheese.where(region: "Île de France")
      when "Centre-Val de Loire"
        @regions = Cheese.where(region: "Centre Val de Loire")
      when "Bourgogne-Franche-Comté"
        @regions = Cheese.where(region: "Bourgogne Franche Comté")
      when "Normandie"
        @regions = Cheese.where(region: "Normandie")
      when "Hauts-de-France"
        @regions = Cheese.where(region: "Hauts de France")
      when "Grand Est"
        @regions = Cheese.where(region: "Grand Est")
      when "Pays de la Loire"
        @regions = Cheese.where(region: "Pays de la Loire")
      when "Bretagne"
        @regions = Cheese.where(region: "Bretagne")
      when "Nouvelle-Aquitaine"
        @regions = Cheese.where(region: "Nouvelle Aquitaine")
      when "Occitanie"
        @regions = Cheese.where(region: "Occitanie")
      when "Auvergne-Rhône-Alpes"
        @regions = Cheese.where(region: "Auvergne Rhône Alpes")
      when "Provence-Alpes-Côte d'Azur"
        @regions = Cheese.where(region: "Provence Alpes Côte d'Azur")
      when "Corse"
        @regions = Cheese.where(region: "Corse")
      end
      respond_to do |format|
        format.json  { render :json => @regions }
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

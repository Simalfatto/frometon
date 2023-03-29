class CheesesController < ApplicationController
  before_action :set_cheese, only: [:show, :edit, :update]
  skip_before_action :authenticate_user!, only: [ :show, :index ]

  def index
    @cheeses = Cheese.all
  end

  def show
    @bookmark = Bookmark.new
    @recipes = Recipe.where(params[:cheese_id])
  end

  def new
    @cheese = Cheese.new
  end

  private

  def set_cheese
		@cheese = Cheese.find(params[:id])
	end

end

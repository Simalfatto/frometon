class CheesesController < ApplicationController
  before_action :set_cheese, only: [:show, :edit, :update]

  def index
    if params[:query].present?
      @cheeses = Cheese.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @cheeses = Cheese.all
    end
  end

  def show
    @recipes = Recipe.where(params[:cheese_id])
  end

  def new
    @cheese = Cheese.new
  end

  private

  def set_cheese
    @cheese = Cheese.find(params[:id])
  end

  def params_cheese
  end

end

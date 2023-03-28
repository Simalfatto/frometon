class CheesesController < ApplicationController
  before_action :set_cheese, only: [:show, :edit, :update, :destroy]

  def index
    @cheeses = Cheese.all
  end

  def show
    @reviews = @cheese.reviews
  end

  def new
    @cheese = Cheese.new
  end

end

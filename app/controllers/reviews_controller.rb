class ReviewsController < ApplicationController
  def new
    @cheese = Cheese.find(params[:cheese_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @cheese = Cheese.find(params[:cheese_id])
    @review.cheese = @cheese
    if @review.save
      redirect_to cheese_path, notice: "Merci pour votre commentaire"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end

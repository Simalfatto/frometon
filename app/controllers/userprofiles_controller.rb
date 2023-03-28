class UserprofilesController < ApplicationController
  def question_1
  end

  def question_2
  end

  def question_3
  end

  def show
    @user = current_user
    @bookmarks = Bookmark.where(user_id: current_user.id)
    @forbiddens = Forbidden.where(user_id: current_user.id)
    @reviews = Review.where(user_id: current_user.id)
  end

  def update
    if current_user.update(user_params)
      redirect_to #next_page
    else
      # render :même page?, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:score_search_vache, :score_search_chevre, :score_search_brebis)
  end
end

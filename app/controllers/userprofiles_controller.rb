class UserprofilesController < ApplicationController
  def question_1
    @user = current_user
  end

  def question_2
    @user = current_user
    if params[:score_search_vache]
      @user.score_search_vache = params[:score_search_vache]
      @user.save
    end
  end

  def question_3
    @user = current_user
    if params[:score_search_chevre]
      @user.score_search_chevre = params[:score_search_chevre]
      @user.save
    end
  end

  def show
    @user = current_user
    if params[:score_search_brebis]
      @user.score_search_brebis = params[:score_search_brebis]
      @user.save
    end
    @score_search_vache = params[:score_search_vache]
    @bookmarks = Bookmark.where(user_id: current_user.id)
    @forbiddens = Forbidden.where(user_id: current_user.id)
    @reviews = Review.where(user_id: current_user.id)
  end

  def update
    if current_user.update(user_params)
    else
      # render :même page?, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:score_search_vache, :score_search_chevre, :score_search_brebis)
  end
end

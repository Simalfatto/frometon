class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :result ]

  def result
    @cheese = Cheese.order("RANDOM()").limit(1).first
  end
end

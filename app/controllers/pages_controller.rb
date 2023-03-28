class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :result ]

  def home

  end

  def result
    if current_user
      cheeses = Cheese.all
      test = []
      vaches = cheeses.where(lait: "vache")
      current_user.score_search_vache.times do
        vache = vaches.sample
        test.push(vache)
      end

      brebis = cheeses.where(lait: "brebis")
      current_user.score_search_brebis.times do
        brebi = brebis.sample
        test.push(brebi)
      end

      chevres = cheeses.where(lait: "chèvre")
      current_user.score_search_chevre.times do
        chevre = chevres.sample
        test.push(chevre)
      end
      @cheese = test.sample
    else
      @cheese = Cheese.order("RANDOM()").limit(1).first
    end
  end
end

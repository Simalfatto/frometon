class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :result ]

  def home

  end

  def result
    if !params["search_all"].present?

      cheeses = Cheese.all
      @params = params

      if current_user
        test = []
        params["AOP"].present? ? cheeses = cheeses.select(&:filter_AOP) : cheeses
        params["enceinte"].present? ? cheeses = cheeses.select(&:filter_pregnant) : cheeses

        if params["vache"].present? && cheeses.select { |cheese| cheese.lait == "vache" } != []
          vaches = cheeses.select { |cheese| cheese.lait == "vache" }
          current_user.score_search_vache.times do
            vache = vaches.sample
            test.push(vache)
          end
        end

        if params["brebis"].present? && cheeses.select { |cheese| cheese.lait == "brebis" } != []
          brebis = cheeses.select { |cheese| cheese.lait == "brebis" }
          current_user.score_search_brebis.times do
            brebi = brebis.sample
            test.push(brebi)
          end
        end

        if params["chèvre"].present? && cheeses.select { |cheese| cheese.lait == "chèvre" } != []
          chevres = cheeses.select { |cheese| cheese.lait == "chèvre" }
          current_user.score_search_chevre.times do
            chevre = chevres.sample
            test.push(chevre)
          end
        end

        if test == []
          @cheese = []
        else
          @cheese = test.sample
        end

      else
        params["vache"].present? ? cheeses : cheeses = cheeses.reject(&:filter_vache)
        params["brebis"].present? ? cheeses : cheeses = cheeses.reject(&:filter_brebis)
        params["chèvre"].present? ? cheeses : cheeses = cheeses.reject(&:filter_chevre)
        params["AOP"].present? ? cheeses = cheeses.select(&:filter_AOP) : cheeses
        params["enceinte"].present? ? cheeses = cheeses.select(&:filter_pregnant) : cheeses
        @cheese = cheeses.sample
      end
    else
      @cheese = Cheese.order("RANDOM()").limit(1).first
    end
  end

  def reload_page
    redirect_back(fallback_location: root_path)
  end
end

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :result, :reload_page ]

  def home

  end

  def result
    if !params["search_all"].present?

      cheeses = Cheese.all

      if current_user
        selection = []
        params["AOP"].present? ? cheeses = cheeses.select(&:filter_AOP) : cheeses
        params["pour_femme_enceinte"].present? ? cheeses = cheeses.select(&:filter_pregnant) : cheeses

        if params["Vache"].present? && cheeses.select { |cheese| cheese.lait == "vache" } != []
          vaches = cheeses.select { |cheese| cheese.lait == "vache" }
          current_user.score_search_vache.times do
            vache = vaches.sample
            selection.push(vache)
          end
        end

        if params["Brebis"].present? && cheeses.select { |cheese| cheese.lait == "brebis" } != []
          brebis = cheeses.select { |cheese| cheese.lait == "brebis" }
          current_user.score_search_brebis.times do
            brebi = brebis.sample
            selection.push(brebi)
          end
        end

        if params["Chèvre"].present? && cheeses.select { |cheese| cheese.lait == "chèvre" } != []
          chevres = cheeses.select { |cheese| cheese.lait == "chèvre" }
          current_user.score_search_chevre.times do
            chevre = chevres.sample
            selection.push(chevre)
          end
        end

        if selection == []
          @cheese = []
        else
          @cheese = selection.sample
        end

      else
        params["Vache"].present? ? cheeses : cheeses = cheeses.reject(&:filter_vache)
        params["Brebis"].present? ? cheeses : cheeses = cheeses.reject(&:filter_brebis)
        params["Chèvre"].present? ? cheeses : cheeses = cheeses.reject(&:filter_chevre)
        params["AOP"].present? ? cheeses = cheeses.select(&:filter_AOP) : cheeses
        params["pour_femme_enceinte"].present? ? cheeses = cheeses.select(&:filter_pregnant) : cheeses
        @cheese = cheeses.sample
      end
    else
      if current_user
        selection = []

        vaches = Cheese.where(lait: "vache")
        current_user.score_search_vache.times do
          vache = vaches.sample
          selection.push(vache)
        end

        brebis = Cheese.where(lait: "brebis")
        current_user.score_search_brebis.times do
          brebi = brebis.sample
          selection.push(brebi)
        end

        chevres = Cheese.where(lait: "chèvre")
        current_user.score_search_chevre.times do
          chevre = chevres.sample
          selection.push(chevre)
        end

        if selection == []
          @cheese = []
        else
          @cheese = selection.sample
        end
      else
        @cheese = Cheese.order("RANDOM()").limit(1).first
      end
    end
  end

  def reload_page
    redirect_back(fallback_location: root_path)
  end
end

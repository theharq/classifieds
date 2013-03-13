class PagesController < ApplicationController
  def index
    @classifieds = Crawler.get_ads_by_section("http://clasificados.elheraldo.co/vivienda/77?sections=vivienda")
  end
end

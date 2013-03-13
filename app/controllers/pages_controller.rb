class PagesController < ApplicationController
  def index
    @classifieds = Crawler.get_page("http://clasificados.elheraldo.co/vivienda/77?sections=vivienda")
  end
end

class PagesController < ApplicationController
  def index
    @classifieds = []
  end

  def create
    @classifieds = Classified.basic_search(content: params[:keyword]) if params[:keyword].present?
    @classifieds = Classified.where(category_id: params[:category]) if params[:category].present?
  end
end

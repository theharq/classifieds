class PagesController < ApplicationController
  def index
    @classifieds = []
    @classifieds = Classified.where(category_id: params[:category]) if params[:category].present?
  end
end

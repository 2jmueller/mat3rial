class PagesController < ApplicationController

  # skip_before_action :authenticate_user!, only: [:home, :search, :show]
  def home
  end

  def search
    # take a query string from the form on the root page, query our database for that string and return it on a different page
    @query = params[:query]
    fetch_categories
    @items = Item.search_by_title_and_description_and_category(@query).where(sold: 'false').geocoded
    @markers = @items.map do |item|
      {
        lat: item.latitude,
        lng: item.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { item: item })
      }
    end
  end

  private

  def fetch_categories
    @categories = Item.distinct.pluck(:category)
  end
end

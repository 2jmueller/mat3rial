class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:search]
  def home
  end

  def search
    # take a query string from the form on the root page, query our database for that string and return it on a different page
    @query = params[:query]
    @items = Item.search_by_title_and_description_and_category(@query).where(sold: false)
    if @items.empty?
      redirect_to root_path, notice: "#{@query} is currently not on sale. Please search again."
    else
      @items_with_location = @items.geocoded
      @markers = @items_with_location.map do |item|
        {
          lat: item.latitude,
          lng: item.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { item: item })
        }
      end
    end
  end
end

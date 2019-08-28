class PagesController < ApplicationController

  # skip_before_action :authenticate_user!, only: [:home, :search, :show]
  def home
  end

  def search
    # take a query string from the form on the root page, query our database for that string and return it on a different page
    @query = params[:query]
    @items = Item.where("category like ?", "%#{params[:query]}%").geocoded
    @markers = @items.map do |item|
      {
        lat: item.latitude,
        lng: item.longitude
      }
    end
    # if @items.length < 3
    #   @items = Item.where("title like ?", "%#{@query}%")
    # else
    #   @items
    # end
    # return @items
  end
end

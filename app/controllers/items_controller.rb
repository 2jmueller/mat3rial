class ItemsController < ApplicationController
  # controller actions for the Items model
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    # list all the items in the database
    @items = Item.all
  end

  # def search
  #   # take a query string from the form on the root page, query our database for that string and return it on a different page
  #   @query = params[:query]
  #   @items = Item.where("category like ?", "%#{@query}%")
  # end

  def show
    # show a specific item on click
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    # creates new instance with the params, saves it, and redirects to
    # user profile page
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to root_path, notice: "Item created sucessfuly"
    else
      render :new
    end
    # redirect to user items list.
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    # finds the item to update by id and updates it with the necessary params
    @item = Item.find(params[:id])
    @item.update(item_params)
  end

  def destroy
    # finds by id and deletes item
    @item = Item.find(params[:id])
    @item.destroy
    # redirect to user profile page
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :category, :price, :location, :photo)
  end
end

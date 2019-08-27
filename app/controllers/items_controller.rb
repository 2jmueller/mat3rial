class ItemsController < ApplicationController
  # controller actions for the Items model
  # before_action
  def index
    # list all the items in the database
    @items = Item.all
  end

  def show
    # show a specific item on click
    @item = Item.find(params[:id])
  end

  def new
    @items = Item.new
  end

  def create
    # creates new instance with the params, saves it, and redirects to
    # user profile page
    @item = Item.new(item_params)
    @item.save
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
    params.require(:item).permit(:title, :description, :category, :price, :location)
  end
end
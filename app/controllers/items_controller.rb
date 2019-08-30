class ItemsController < ApplicationController
  # controller actions for the Items model
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]
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
    # edit an existing item
  end

  def update
    # finds the item to update by id and updates it with the necessary params
    @item.update(item_params)
    if @item.save
      redirect_to user_path(current_user), notice: "updated the item successfully"
    else
      redirect_to user_path
    end
  end

  def destroy
    # finds by id and deletes item
    if @item.user_id == current_user.id
      @item.destroy!
    # redirect to user profile page
      redirect_to user_path(current_user), notice: "deleted the item"
    else
      redirect_to root_path, notice: "tried to be a naughty boy and delete an item that isn't yours"
    end
  end

  private

  def find_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :description, :category, :price, :location, :photo)
  end
end

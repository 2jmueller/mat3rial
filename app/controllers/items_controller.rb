class ItemsController < ApplicationController
  # controller actions for the Items model
  # before_action
  def index
    # list all the items in the database
    @items = Item.all
  end

  def show
    # show a specific item on click
    @yallah
  end
end

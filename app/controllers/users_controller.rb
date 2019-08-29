class UsersController < ApplicationController
  before_action :fetch_user, only: %i(edit update destroy show)
  # def index
  #   # list all the items in the database
  #   @users = User.all
  # end

  # def show
  #   # show a specific User on click
  #   @user = User.find(params[:id])
  # end

  # def new
  #   @user = User.new
  # end

  # def create
  #   # creates new instance with the params, saves it, and redirects to
  #   # user profile page
  #   @user = User.new(user_params)
  #   @user.save
  #   # redirect to user items list.
  # end

  def edit
  end

  def update
    # finds the User to update by id and updates it with the necessary params
    @user.update(item_params)
  end

  def destroy
    # finds by id and deletes User
    @user.destroy
    # redirect to user profile page
  end
  def show
    @transactions = @user.transactions
    @items_on_sell = @user.items.where(sold: false)
    @items_sold = @user.items.where(sold: true)
    @transactions_pending = @transactions.where(status: "pending")
    @transactions_past = @transactions.where(status: "accepted"||"decline")
  end
  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :user_location, :email)
  end
  def fetch_user
    @user = User.find(params[:id])
  end
end

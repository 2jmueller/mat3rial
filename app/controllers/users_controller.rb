class UsersController < ApplicationController
  def index
    # list all the items in the database
    @users = User.all
  end

  def show
    # show a specific User on click
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    # creates new instance with the params, saves it, and redirects to
    # user profile page
    @user = User.new(user_params)
    @user.save
    # redirect to user items list.
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    # finds the User to update by id and updates it with the necessary params
    @user = User.find(params[:id])
    @user.update(item_params)
  end

  def destroy
    # finds by id and deletes User
    @user = User.find(params[:id])
    @user.destroy
    # redirect to user profile page
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :user_location, :email)
  end
end

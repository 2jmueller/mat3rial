class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
  end

  def new
    @transcation = Transaction.new
    # redirect_to some page in the future
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def create
    @transaction = Transaction.new(transcation_params)
  end

  private

  def transcation_params
    params.require(:transactions).permit(:user_id, :item_id)
  end
end

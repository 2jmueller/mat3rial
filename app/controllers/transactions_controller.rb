class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.all
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
    @transcation = Transaction.new
    # redirect_to some page in the future
  end

  def create
    @transaction = Transaction.new
    @transaction.item = Item.find(params[:item_id])
    @transaction.user = current_user
    @transaction.save

    @item = Item.find(params[:item_id])
    redirect_to item_path(@item), flash: { success: "Transaction completed" }
  end

  def accept
    @transaction = Transaction.find(params[:id])
    @transaction.status = "accepted"
    @transaction.save
    redirect_to user_path, notice: "transaction accepted"
  end

  def decline
    @transaction = item.transactions.where(status: 'pending')
    @transaction.status = "decline"
    @transaction.save
  end

  private

  def transaction_params
    params.require(:transactions).permit(:user_id, :item_id, :status)
  end
end

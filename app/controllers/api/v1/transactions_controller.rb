class Api::V1::TransactionsController < Api::ApplicationController
  before_action :set_account

  def index
    @transactions = @account.transactions.order(:id)
    render json: @transactions
  end

  def edit
    
  end

  def destroy
    
  end

  def new
    
  end

  private

  def set_account
    @account = Account.find params[:account_id]
  end
end
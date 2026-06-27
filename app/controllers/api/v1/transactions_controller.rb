class Api::V1::TransactionsController < ApplicationController
  before_action :set_account

  def index
    @transactions = @account.transactions
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
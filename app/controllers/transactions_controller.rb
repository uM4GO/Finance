class TransactionsController < ApplicationController
  before_action :set_account

  def index
    @transactions = @account.transactions
  end

  private

  def set_account
    @account = Account.find params[:account_id]
  end
end

#formulario para transactions
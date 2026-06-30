class TransactionsController < ApplicationController
  before_action :set_account

  def index
    @transactions = @account.transactions
  end

  def edit
    
  end

  def destroy
    
  end

  def new
    #@account = Account.find(params[:account_id])
    @transaction = @account.transactions.new
  end

  def create
    @transaction = @account.transactions.new(transactions_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to account_transactions_path, notice: "Transação criada com sucesso!", status: :see_other}
      else 
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_account
    @account = Account.find params[:account_id]
  end

  def transactions_params
    params.expect(transaction: [ :amount, :description, :transaction_type, :date ])
  end
end
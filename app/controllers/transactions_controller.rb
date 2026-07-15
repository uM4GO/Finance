class TransactionsController < ApplicationController
  before_action :set_account
  before_action :set_transaction, only: %i[edit destroy update]

  def index
    @transactions = @account.transactions.order(:date)
  end

  def edit
    
  end

  def update
    respond_to do |format|
      if @transaction.update(transactions_params)
      UpdateDailyBalancesService.new(@transaction.account, @transaction.date).call
        format.html { redirect_to account_transactions_path, notice: "A transação foi atualizada.", status: :see_other }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @transaction.destroy!
    UpdateDailyBalancesService.new(@transaction.account, @transaction.date).call
    respond_to do |format|
      format.html { redirect_to account_transactions_path, notice: "Transação foi removida.", status: :see_other }
    end
  end

  def new
    #@account = Account.find(params[:account_id])
    @transaction = @account.transactions.new
  end

  def create
    @transaction = @account.transactions.new(transactions_params)

    respond_to do |format|
      if @transaction.save
        RegisterDailyBalanceService.new(@transaction.account, @transaction.date).call
        UpdateDailyBalancesService.new(@transaction.account, @transaction.date).call
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

  def set_transaction
    @transaction = @account.transactions.find params[:id]
  end

  def transactions_params
    params.expect(transaction: [ :amount, :description, :transaction_type, :date ])
  end
end
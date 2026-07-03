class AccountsController < ApplicationController
  before_action :set_account, only: %i[ edit update destroy register_daily_balance ]

  def index
    @accounts = Account.all
  end

  def new
    @account = Account.new
  end

  def edit
    #@account = Account.find(params.expect(:id))
  end

  def create
    @account = Account.new(accounts_params)

    respond_to do |format|
      if @account.save
        format.html { redirect_to accounts_path, notice: "Conta criada com sucesso!", status: :see_other}
      else 
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    #@account = Account.find(params.expect(:id))
    respond_to do |format|
      if @account.update(accounts_params)
        format.html { redirect_to accounts_path, notice: "Conta foi atualizada.", status: :see_other }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @account.destroy!

    respond_to do |format|
      format.html { redirect_to accounts_path, notice: "Conta foi removida.", status: :see_other }
    end
  end

  def register_daily_balance
    service = RegisterDailyBalanceService.new(@account, Date.today)
    service.call
    respond_to do |format|
      format.html { redirect_to accounts_path, notice: "Ação executada.", status: :see_other }
    end
  end

  private

  def set_account
    @account = Account.find(params[:id] || params[:account_id])
  end
  
  def accounts_params
    params.expect(account: [ :agency_number, :account_number, :bank_id ])
  end
end

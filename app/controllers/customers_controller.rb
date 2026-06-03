
class CustomersController < ApplicationController
  before_action :set_customer, only: %i[ edit update destroy ]

  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end
  
  def edit
  end

  def create
    @customer = Customer.new(customers_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to customers_path, notice: "Cliente criado com sucesso!", status: :see_other}
      else 
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  def update
      #@account = Account.find(params.expect(:id))
    respond_to do |format|
      if @customer.update(customers_params)
        format.html { redirect_to customers_path, notice: "O cliente foi atualizado.", status: :see_other }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customers_params
    params.expect(customer: [ :name, :address, :birth_date, :cpf, :kind, :cep, :active ])
  end
end

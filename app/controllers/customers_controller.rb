
class CustomersController < ApplicationController
  before_action :set_customer, only: %i[ edit update destroy ]

  def index
    @customers = Customer.all
  end

  def edit
  end

  def create
  end

  def destroy
  end

  def update
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end
end

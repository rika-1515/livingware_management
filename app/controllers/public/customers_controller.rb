class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!, except: [:top]

  def show
    @customer = current_customer
  end

  def edit
    @customer=Customer.find(current_customer.id)
  end

  def update
    @customer=Customer.find(current_customer.id)
    if @customer.update(customer_params)
      redirect_to customers_path
    else
      render :edit
    end
  end

  def quit
  end

  def out
    @customer=current_customer
    @customer.update(is_active: false)
    reset_session
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(:name,:email)
  end
end

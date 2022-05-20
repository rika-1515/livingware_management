class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @customers=Customer.page(params[:page]).per(10)
  end

  def show
    @customer=Customer.find(params[:id])
    @customers=Customer.page(params[:page])
  end

  def edit
    @customer=Customer.find(params[:id])
  end
  
  def update
    customer=Customer.find(params[:id])
    if customer.update(customer_params)
      redirect_to admin_customer_path(customer.id)
    else
      render :edit
    end
  end
  
  
  private
  # ストロングパラメータ
  def customer_params
    params.require(:customer).permit(:name,:email,:is_active)
  end
end

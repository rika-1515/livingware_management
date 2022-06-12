class Public::InquiriesController < ApplicationController
  before_action :authenticate_customer!, except: [:top]
  
  def new
    @inquiry = Inquiry.new
  end
  
  def create
    @inquiry = Inquiry.new(inquiry_params)
    @inquiry.customer_id = current_customer.id
    if @inquiry.save
      redirect_to customers_path
    else
      render :new
    end
  end
  
  
  private
  # ストロングパラメータ
  def inquiry_params
    params.require(:inquiry).permit(:title,:body,:customer_id)
  end
  
end

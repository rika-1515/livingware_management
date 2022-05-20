class Admin::InquiriesController < ApplicationController
  def show
    @inquiry = Inquiry.find(params[:id])
  end
  
  def update
    @inquiry = Inquiry.find(params[:id])
    @inquiry.update(inquiry_params)
    redirect_to admin_inqury_path
  end
  
  
  private
  # ストロングパラメータ
  def inquiry_params
    params.require(:inquiry).permit(:support_status)
  end
end

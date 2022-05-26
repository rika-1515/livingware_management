class Public::ToBuyListsController < ApplicationController
  def index
    @livingwares = current_customer.group.livingwares.order(:category_id)
    @categories = current_customer.group.categories
  end
  
  def log
    @livingware = Livingware.new(livingware_params)
    @categories = current_customer.group.categories
    # byebug
    
    @livingwares = []
    params[:livingware].select {|k, v| v[:id].present? }.each do |id, param|
      livingware = current_customer.group.livingwares.find(id)
      livingware.amount = livingware.amount + param[:buy_amount].to_i
      @livingwares.push livingware

    end
    
    # @livingwares = current_customer.group.livingwares.where(id: params[:livingware][:id])
    # @livingwares.each do |livingware|
    #   livingware.amount = livingware.amount + livingware.buy_amount
    #   livingware.amount_standard = livingware.amount_standard
    #   livingware.category.name = livingware.category.name
    #   livingware.name = livingware.name
    # end
  end
  
  def update
    # byebug
    params[:livingware].each do |id, param|
      livingware = current_customer.group.livingwares.find(id)
      buy_amount = livingware.amount_standard - param[:amount].to_i
      livingware.update(buy_amount: buy_amount, amount: param[:amount].to_i)
    end
    redirect_to to_buy_lists_path
  end
  
  
  private

  def livingware_params
    params.require(:livingware).permit(:category_id,:group_id,:change,:amount,:buy_amount)
  end
  
  
  
end

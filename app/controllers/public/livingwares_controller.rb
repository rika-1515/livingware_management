class Public::LivingwaresController < ApplicationController
  def index
    @livingwares = current_customer.group.livingwares.order(:category_id)
    @categories = current_customer.group.categories
  end
  
  def log
    @livingware = Livingware.new(livingware_params)
    @categories = current_customer.group.categories
    @livingwares = current_customer.group.livingwares
    if params[:livingware][:change] == 'true'
      @livingware.amount = @livingware.amount + @livingware.buy_amount
      @livingware.amount_standard = @livingware.amount_standard
      @livingware.category.name = @livingware.category.name
      @livingware.livingware.name = @livingware.livingware.name
    end
  end
  
  def show
    @livingware = Livingware.find(params[:id])
    @categories = current_customer.group.categories
  end

  def new
    @livingware = Livingware.new
    @categories = current_customer.group.categories
  end
  
  def create
    @livingware = Livingware.new(livingware_params)
    @livingware.group_id = current_customer.group_id
    if @livingware.save
      redirect_to livingwares_path
    else
      @categories = current_customer.group.categories
      render :new
    end
  end

  def edit
    @livingware = Livingware.find(params[:id])
    @categories = current_customer.group.categories
  end
  
  def update
    @livingware = Livingware.find(params[:id])
    if @livingware.update(livingware_params)
      redirect_to livingware_path(@livingware.id)
    else
      @categories = current_customer.group.categories
      render :edit
    end
  end
  
  def destroy
    @livingware = Livingware.find(params[:id])
    @livingware.destroy
    redirect_to livingwares_path
  end
  
  
  
  private

  def livingware_params
    params.require(:livingware).permit(:category_id,:group_id,:name,:note,:amount,:amount_standard,:livingware_image)
  end
  
end

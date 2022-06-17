class Admin::MasterLivingwaresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @livingware = MasterLivingware.new
    @livingwares = MasterLivingware.all.order(:master_category_id)
    @categories = MasterCategory.all
  end

  def create
    @livingware = MasterLivingware.new(master_livingware_params)
    @livingware.admin_id = current_admin.id
    if @livingware.save
      redirect_to admin_master_livingwares_path
    else
      @livingwares = MasterLivingware.all
      @categories = MasterCategory.all
      render :index
    end
  end

  def edit
    @livingware = MasterLivingware.find(params[:id])
    @categories = MasterCategory.all
  end

  def update
    @livingware = MasterLivingware.find(params[:id])
    if @livingware.update(master_livingware_params)
      redirect_to admin_master_livingwares_path
    else
      @categories = MasterCategory.all
      render :edit
    end
  end

  def destroy
    @livingware = MasterLivingware.find(params[:id])
    @livingware.destroy
    redirect_to admin_master_livingwares_path
  end


  private

  def master_livingware_params
    params.require(:master_livingware).permit(:master_category_id,:admin_id,:name)
  end

end

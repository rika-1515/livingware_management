class Admin::MasterCategoriesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @category = MasterCategory.new
    @categories = MasterCategory.all
  end

  def create
    @category = MasterCategory.new(master_category_params)
    @category.admin_id = current_admin.id
    if @category.save
      redirect_to admin_master_categories_path
    else
      @categories = MasterCategory.all
      render :index
    end
  end

  def edit
    @category = MasterCategory.find(params[:id])
  end

  def update
    @category = MasterCategory.find(params[:id])
    if @category.update(master_category_params)
      redirect_to admin_master_categories_path
    else
      render :edit
    end
  end

  def destroy
    @category = MasterCategory.find(params[:id])
    @category.destroy
    redirect_to admin_master_categories_path
  end


  private
  # ストロングパラメータ
  def master_category_params
    params.require(:master_category).permit(:admin_id,:name)
  end

end

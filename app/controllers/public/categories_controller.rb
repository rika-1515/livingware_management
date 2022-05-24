class Public::CategoriesController < ApplicationController
  def index
    @category = Category.new
    @categories = current_customer.group.categories
  end
  
  def create
    @category = Category.new(category_params)
    @category.group_id = current_customer.group_id
    if @category.save
      redirect_to categories_path
    else
      @categories = current_customer.group.categories
      render :index
    end
  end

  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      redirect_to categories_path
    else
      render :edit
    end
  end
  
  private
  # ストロングパラメータ
  def category_params
    params.require(:category).permit(:group_id,:name)
  end
  
end
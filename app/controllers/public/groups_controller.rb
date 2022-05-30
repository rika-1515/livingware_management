class Public::GroupsController < ApplicationController
  def edit
    @group = Group.find(current_customer.group_id)
  end
  
  def update
    @group = Group.find(current_customer.group_id)
    if @group.update(group_params)
      redirect_to groups_path
    else
      render :edit
    end
  end

  def show
    @group = current_customer.group
    @members = @group.customers
  end
  
  def search
    @group = Group.where(token: params[:token]).first
    unless params[:commit]
      @first = true
    end
  end
  
  def join
    @customer=Customer.find(current_customer.id)
    byebug
    @customer.update(group_id_params)
    redirect_to groups_path
  end
  
  
  
  
  
  private
  # ストロングパラメータ
  def group_params
    params.require(:group).permit(:name)
  end
  
  def group_id_params
    params.require(:group).permit(customer_attributes:[:group_id])
  end
  
end

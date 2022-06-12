class Public::GroupsController < ApplicationController
  before_action :authenticate_customer!, except: [:top]
  
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
    @customer = Customer.find(current_customer.id)
  end
  
  def join
    @customer = Customer.find(current_customer.id)
    @customer.update(group_id_params)
    redirect_to groups_path
  end
  
  def quit
    customer = Customer.find(current_customer.id)
    group = Group.find_by(group_leader_customer_id: customer.id)
    customer.group_id = group.id
    customer.save
    redirect_to groups_path
  end
  
  def out
    customer_id = params[:customer][:customer_id]
    group = Group.find_by(group_leader_customer_id: customer_id)
    customer = Customer.find(customer_id)
    customer.group_id = group.id
    customer.save
    redirect_to groups_path
  end
  
  
  
  private
  # ストロングパラメータ
  def group_params
    params.require(:group).permit(:name)
  end
  
  def group_id_params
    params.require(:customer).permit(:group_id)
  end
  
end

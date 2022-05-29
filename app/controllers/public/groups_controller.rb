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
  end
  
  def join
    @group = Group.find_by(id: params[:id])
    
  end
  
  
  
  
  
  private
  # ストロングパラメータ
  def group_params
    params.require(:group).permit(:name)
  end
  
  # def group_search_params
  #   params.fetch(:seach,{}).permit(:token)
  # end
  
end

class Public::ToBuyListsController < ApplicationController
  def index
    @livingwares = current_customer.group.livingwares.order(:category_id)
    @categories = current_customer.group.categories
    @livingware = Livingware.new
  end
end

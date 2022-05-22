class Public::ToBuyListsController < ApplicationController
  def index
    @livingwares = current_customer.group.livingwares.select(livingware.to_buy_judge.negative?('true')).order(:category_id)
    @categories = current_customer.group.categories
  end
end

class AddBuyAmountToLivingwares < ActiveRecord::Migration[6.1]
  def change
    add_column :livingwares, :buy_amount, :integer, default: 0
  end
end

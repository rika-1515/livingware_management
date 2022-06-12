class AddChangeToLivingwares < ActiveRecord::Migration[6.1]
  def change
    add_column :livingwares, :change, :boolean, default: false
  end
end

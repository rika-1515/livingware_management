class RemoveChangeFromLivingwares < ActiveRecord::Migration[6.1]
  def change
    remove_column :livingwares, :change, :boolean
  end
end

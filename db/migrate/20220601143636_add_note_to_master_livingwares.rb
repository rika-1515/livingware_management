class AddNoteToMasterLivingwares < ActiveRecord::Migration[6.1]
  def change
    add_column :master_livingwares, :note, :text
  end
end

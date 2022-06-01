class RemoveNoteFromMasterLivingwares < ActiveRecord::Migration[6.1]
  def change
    remove_column :master_livingwares, :note, :text
  end
end

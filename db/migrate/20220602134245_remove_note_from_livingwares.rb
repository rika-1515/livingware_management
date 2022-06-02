class RemoveNoteFromLivingwares < ActiveRecord::Migration[6.1]
  def change
    remove_column :livingwares, :note, :text
  end
end

class AddNoteToLivingwares < ActiveRecord::Migration[6.1]
  def change
    add_column :livingwares, :note, :text
  end
end

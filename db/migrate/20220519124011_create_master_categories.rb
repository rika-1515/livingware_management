class CreateMasterCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :master_categories do |t|
      t.string :admin_id
      t.string :name

      t.timestamps
    end
  end
end

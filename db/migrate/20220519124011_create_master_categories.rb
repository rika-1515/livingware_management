class CreateMasterCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :master_categories do |t|
      t.integer :admin_id, null: false
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end

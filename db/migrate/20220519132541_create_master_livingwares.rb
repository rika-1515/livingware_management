class CreateMasterLivingwares < ActiveRecord::Migration[6.1]
  def change
    create_table :master_livingwares do |t|
      
      t.integer :master_category_id, null: false
      t.integer :admin_id, null: false
      t.string :name, null: false
      t.text :note, null: false
      t.integer :amount, null: false, default: 0
      t.integer :amount_standard, null: false, default: 0

      t.timestamps null: false
    end
  end
end

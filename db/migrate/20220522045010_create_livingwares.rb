class CreateLivingwares < ActiveRecord::Migration[6.1]
  def change
    create_table :livingwares do |t|
      t.integer :category_id, null: false
      t.integer :group_id, null: false
      t.string :name, null: false
      t.text :note, null: false
      t.integer :amount, null: false, default: 0
      t.integer :amount_standard, null: false, default: 0

      t.timestamps null: false
    end
  end
end

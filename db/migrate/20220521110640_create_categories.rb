class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.integer :group_id, null: false
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end

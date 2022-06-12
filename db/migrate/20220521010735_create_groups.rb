class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.integer :group_leader_customer_id, null: false
      t.string :name
      t.string :token

      t.timestamps
    end
  end
end

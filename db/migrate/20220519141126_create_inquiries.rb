class CreateInquiries < ActiveRecord::Migration[6.1]
  def change
    create_table :inquiries do |t|
      t.integer :customer_id, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.integer :support_status, null: false, default: 0

      t.timestamps
    end
  end
end

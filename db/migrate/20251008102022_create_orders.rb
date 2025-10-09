class CreateOrders < ActiveRecord::Migration[8.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal "total_amount", precision: 18, scale: 2
      t.decimal "delivery_fee", precision: 18, scale: 2
      t.string "status", null: false
      t.timestamps
    end
  end
end

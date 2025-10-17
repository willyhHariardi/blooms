class CreateSubProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :sub_products do |t|
      t.references :product, null: false, foreign_key: true
      t.string :name, null: false
      t.decimal :price, precision: 10, scale: 2, null: false
      t.timestamps
    end
  end
end

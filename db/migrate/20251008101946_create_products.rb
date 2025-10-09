class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string "title", null: false
      t.text "description"
      t.decimal "price", precision: 18, scale: 2
      t.references :category_product, null: false, foreign_key: true
      t.timestamps
    end
  end
end

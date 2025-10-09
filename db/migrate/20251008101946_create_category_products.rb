class CreateCategoryProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :category_products do |t|
      t.string "title", null: false
      t.timestamps
    end
  end
end

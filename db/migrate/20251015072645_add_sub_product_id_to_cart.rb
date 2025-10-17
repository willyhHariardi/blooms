class AddSubProductIdToCart < ActiveRecord::Migration[8.0]
  def change
     add_column :carts, :sub_product_id, :integer, if_not_exists: true
  end
end

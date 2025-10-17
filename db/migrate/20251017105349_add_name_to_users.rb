class AddNameToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :name, :string, if_not_exists: true
    add_column :users, :avatar_url, :string, if_not_exists: true
  end
end

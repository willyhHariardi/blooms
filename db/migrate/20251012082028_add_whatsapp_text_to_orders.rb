class AddWhatsappTextToOrders < ActiveRecord::Migration[8.0]
  def change
    add_column :orders, :whatsapp_text, :text, if_not_exists: true
    add_column :orders, :phone_number, :string, if_not_exists: true
    add_column :orders, :deliver_name, :text, if_not_exists: true
    add_column :orders, :address, :text, if_not_exists: true
  end
end

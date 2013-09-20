class AddDeliveryToPins < ActiveRecord::Migration
  def change
    add_column :pins, :Delivery, :string
  end
end

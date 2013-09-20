class AddInstapidToPins < ActiveRecord::Migration
  def change
    add_column :pins, :instapid, :string
  end
end

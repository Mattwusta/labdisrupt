class AddInstaidToPins < ActiveRecord::Migration
  def change
    add_column :pins, :instaid, :string
  end
end

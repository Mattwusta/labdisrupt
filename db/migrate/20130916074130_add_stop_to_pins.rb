class AddStopToPins < ActiveRecord::Migration
  def change
    add_column :pins, :stop, :string
  end
end

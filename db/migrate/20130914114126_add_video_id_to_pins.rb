class AddVideoIdToPins < ActiveRecord::Migration
  def change
    add_column :pins, :yt_video_id, :string
  end
end

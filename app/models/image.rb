class Image < ActiveRecord::Base
  def image_path
     "/app/public/images/#{filename}"
  end
end
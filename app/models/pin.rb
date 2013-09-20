class Pin < ActiveRecord::Base
  extend FriendlyId
    friendly_id :name, use: :slugged

def should_generate_new_friendly_id?
  new_record?
end

attr_accessible :id, :description, :image, :image_remote_url, :name, :Delivery, :yt_video_id, :stop, :instaid, :instapid #This line won't work in Rails 4, instead, you'll have to do what I show below
  validates :image, presence: true
  validates :description, presence: true
  validates :name, presence: true

  has_attached_file :image, styles: { medium: "800x300>"}
  validates_attachment :image, content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] },
  size: { less_than: 5.megabytes }
  
belongs_to :user


def self.search(search)
  if search
    find(:all, :conditions => ['description LIKE ?', "%#{search}%"])
  
  else
    find(:all, order: "created_at desc")
  end
end

def image_remote_url=(url_value)
    self.image = URI.parse(url_value) unless url_value.blank?
  super
end

def video_yt_video_id=(id_value)
    self.video = URI.parse(id_value) unless id_value.blank?
  super
end
end



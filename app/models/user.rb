class User < ActiveRecord::Base
	extend FriendlyId
  friendly_id :name, use: :slugged

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, #:recoverable
  :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :address, :mobile, :provider, :uid
   # attr_accessible :title, :body

  has_many :pins, :dependent => :destroy
end

def self.find_for_facebook_oauth(auth, signed_in_resource = nil)
    user = User.where(provider: auth.provider, uid: auth.uid).first
    if user.present?
        user
    else
        user = User.create(first_name:auth.extra.raw_info.first_name,
                                             last_name:auth.extra.raw_info.last_name,
                                             facebook_link:auth.extra.raw_info.link,
                                             user_name:auth.extra.raw_info.name,
                                             provider:auth.provider,
                                             uid:auth.uid,
                                             email:auth.info.email,
                                             password:Devise.friendly_token[0,20])
    end
end

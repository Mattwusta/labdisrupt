class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
  model = Model.where(:provider => auth.provider, :uid => auth.uid).first
  return model if model
  model = Model.create(name:auth.extra.raw_info.name,
                         provider:auth.provider,
                         uid:auth.uid,
                         email:auth.info.email,
                         password:Devise.friendly_token[0,20]
                         )
end
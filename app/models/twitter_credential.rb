class TwitterCredential
  include Mongoid::Document

  field :provider, type: String, default: ""
  field :uid, type: String, default: ""
  field :name, type: String, default: ""
  field	:oauth_token, type: String, default: ""
  field	:oauth_secret, type: String, default: ""
  
  belongs_to :user  

  def self.from_omniauth(auth, user_id)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |tc|
      tc.provider = auth.provider
      tc.uid = auth.uid
      tc.name = auth.info.name
      tc.oauth_token = auth.credentials.token
      tc.oauth_secret = auth.credentials.secret
      tc.user_id = user_id
      tc.save!
    end
  end

end

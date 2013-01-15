class Man < ActiveRecord::Base
  attr_accessible :name, :oauth_expires_at, :oauth_token, :provider, :uid
def self.from_omniauth(auth)
  where(auth.slice(:provider, :uid)).first_or_initialize.tap do |man|
    man.provider = auth.provider
    man.uid = auth.uid
    man.name = auth.info.name
    man.oauth_token = auth.credentials.token
    man.oauth_expires_at = Time.at(auth.credentials.expires_at)
    man.save!
  end
end

end

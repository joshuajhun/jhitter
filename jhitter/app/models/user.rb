class User < ActiveRecord::Base
  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.name               = auth_info.extra.raw_info.name
      new_user.oauth_token_secret = auth_info.credentials.secret
      new_user.oauth_token        = auth_info.credentials.token
    end
    user = User.find_by(uid: auth_info.uid)
    user.profile_picture    = auth_info.info.image
    user.location           = auth_info.info.location
    user.description        = auth_info.extra.raw_info.description
    user.screen_name        = auth_info.extra.raw_info.screen_name
    user.background_picture = auth_info.extra.raw_info.profile_banner_url
    user.followers          = auth_info.extra.raw_info.followers_count
    user.following          = auth_info.extra.raw_info.friends_count
    user.likes              = auth_info.extra.raw_info.favourites_count
    user.tweet_count        = auth_info.extra.raw_info.statuses_count
    user.save
    user
  end

end

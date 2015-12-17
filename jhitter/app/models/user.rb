class User < ActiveRecord::Base
  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.uid                = auth_info.uid
      new_user.oauth_token_secret = auth_info.credentials.secret
      new_user.oauth_token        = auth_info.credentials.token
      new_user.profile_picture    = auth_info.info.image
      new_user.location           = auth_info.info.location
      new_user.description        = auth_info.extra.raw_info.description
      new_user.name               = auth_info.extra.raw_info.name
      new_user.screen_name        = auth_info.extra.raw_info.screen_name
      new_user.background_picture = auth_info.extra.raw_info.profile_banner_url
      new_user.followers          = auth_info.extra.raw_info.followers_count
      new_user.following          = auth_info.extra.raw_info.friends_count
      new_user.likes              = auth_info.extra.raw_info.favourites_count
      new_user.tweet_count        = auth_info.extra.raw_info.statuses_count
    end
  end

end

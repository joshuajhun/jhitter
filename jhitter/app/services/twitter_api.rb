class TwitterApi
  attr_reader :connection

  def initialize(user)
    @user = user
    @connection = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["twitter_api_key"]
      config.consumer_secret     = ENV["twitter_secret_key"]
      config.access_token        = @user.oauth_token
      config.access_token_secret = @user.oauth_token_secret
    end
  end

  def tweets
    connection.home_timeline
  end

  def tweet(id)
    binding.pry
    connection.status(id)
  end

  def new_tweet(message)
    connection.update(message)
  end

  def fav_tweet(tweet)
    connection.favorite(tweet)
  end

  def fav_count_tweet
    connection.favorite_count
  end
end

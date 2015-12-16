class TwitterApi
  attr_reader :connection

  def initialize
    @connection ||= Twitter::REST::Client.new do |config|
      user = User.first
      config.consumer_key        = ENV["twitter_api_key"]
      config.consumer_secret     = ENV["twitter_secret_key"]
      config.access_token        = user.oauth_token
      config.access_token_secret = user.oauth_token_secret
    end
  end

  def tweets
    connection.user_timeline(User.first.uid.to_i)
  end

  def tweet(id)
    connection.status(id)
  end

  def new_tweet(status)
    binding.pry
    connection.update()
  end
end

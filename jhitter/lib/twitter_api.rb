class TwitterApi

  def self.client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["twitter_api_key"]
      config.consumer_secret     = ENV["twitter_secret_key"]
    end
  end

  def self.public_tweets(user)
    client.user_timeline(user)
  end

  def self.find_user(user)
    client.user(user)
  end

  def self.followers(user)
    client.followers(user)
  end

  def self.following(user)
    client.friends()
  end 
end

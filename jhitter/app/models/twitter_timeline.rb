class TwitterTimeline

  def self.service(user)
    TwitterApi.new(user)
  end

  def self.all(user)
    service(user).tweets
  end

  def self.find(user, id)
    service(user).tweet(id)
  end

  def self.create(message, user)
    service(user).new_tweet(message)
  end

  def self.favor(tweet, user)
    service(user).fav_tweet(tweet)
  end

  def self.favor_count(user)
    service(user).fav_count_tweet
  end
end

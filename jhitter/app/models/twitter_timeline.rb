class TwitterTimeline

  def self.service(user)
    TwitterApi.new(user)
  end

  def self.all(user)
    service(user).tweets
  end

  def self.find(id, user)
    service(user).tweet(id)
  end

  def self.create(status, user)
    service(user).new_tweet(status)
  end
end

class TwitterTimeline

  def self.service
    TwitterApi.new
  end

  def self.all
    service.tweets
  end

  def self.find(id)
    service.tweet(id)
  end

  def self.create(status)
    service.new_tweet(status)
  end
end

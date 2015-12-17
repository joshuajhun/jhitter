require 'test_helper'

class TwitterApiTest < ActiveSupport::TestCase
  attr_reader :service, :test_user

  def create_user
    @test_user = User.new({id: 9,
                name: "jhitter",
                screen_name: "jhittertweets",
                uid: "4580803393",
                oauth_token: "4580803393-g1ckhlOgOIySt9vCzR6IgcCLU7wghvzOfJgHSoX",
                oauth_token_secret: "qgRKEoS1RcgOK4yfZscjXdKIJ3Q6hHzohdyIt85EEL1UB",
                created_at: "2015-12-17 16:51:05",
                updated_at: "2015-12-17 16:51:05",
                description: "",
                profile_picture: "http://pbs.twimg.com/profile_images/67732577916474...",
                location: "",
                background_picture: nil,
                followers: 0,
                following: 0,
                likes: 0,
                tweet_count:1 })

  end

  def setup
    @service = TwitterApi.new(test_user)
  end

  test '#tweets' do
  VCR.use_cassette("twitter_api#tweets") do
    tweets = service.tweets
    tweet  = tweets.first

    assert_equal 20, tweets.count
    end
  end
end

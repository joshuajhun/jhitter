require './test/test_helper'

class TwitterApiTest < ActiveSupport::TestCase
  attr_reader :service

  def setup
    @service = TwitterApi.new(User.last)
  end

  test '#tweets' do
  VCR.use_cassette("twitter_api#tweets") do
    tweets = service.tweets
    tweet  = tweets.first

    assert_equal 20, tweets.count
    end
  end
end

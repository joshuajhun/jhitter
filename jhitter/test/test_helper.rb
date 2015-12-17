
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/emoji'
require 'capybara/rails'
require 'pry'
require 'webmock'
require 'vcr'
require  'SimpleCov'
SimpleCov.start

class ActiveSupport::TestCase
  fixtures :all
  include Capybara::DSL

  VCR.configure do |config|
    config.cassette_library_dir = 'test/cassettes'
    config.hook_into(:webmock)
    config.allow_http_connections_when_no_cassette = true
  end

  def setup
    Capybara.app = Jhitter::Application
    stub_omniauth
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      provider: 'twitter',
           uid: "4580803393",
      info: {
        image: "http://pbs.twimg.com/profile_images/677325779164749824/7g1VMEbu_normal.jpg",
        location: ""
      },
      extra: {
        raw_info: {
          name: "jhitter",
          screen_name: "jhittertweets",
          description: "",
          profile_banner_url: nil,
          followers_count: 0,
          friends_count: 0,
          favourites_count: 0,
          statuses_count: 1
        }
      },
      credentials: {
        token: ENV["twitter_test_key"],
        secret:ENV["twitter_test_secret"]
      }
    })
  end
end

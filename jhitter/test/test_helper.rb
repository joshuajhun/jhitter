
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
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
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
      uid: "4580803393",
      provider: 'twitter',
      extra: {
        raw_info: {
          user_id: "1234",
          name: "jhitter",
          screen_name: "jhittertweets",
        }
      },
      credentials: {
        token: "4580803393-g1ckhlOgOIySt9vCzR6IgcCLU7wghvzOfJgHSoX",
        secret: "qgRKEoS1RcgOK4yfZscjXdKIJ3Q6hHzohdyIt85EEL1UB"
      }
    })
  end
end

require 'test_helper'

class OAuthUserTest < ActionDispatch::IntegrationTest
  test "logging in works" do
    visit '/'
    assert_equal 200, page.status_code
    click_link 'login'
    assert_equal '/', current_path
    assert page.has_content?('joshuajhun')
    assert page.has_link?('logout')
  end

  test" a user can logout" do
    visit '/'
    assert_equal 200, page.status_code
    click_link 'login'
    assert_equal '/', current_path
    assert page.has_content?('joshuajhun')
    assert page.has_link?('logout')
    click_link "logout"
    assert_equal root_path, current_path
  end 
end

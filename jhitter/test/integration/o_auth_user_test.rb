require 'test_helper'

class OAuthUserTest < ActionDispatch::IntegrationTest
  test "logging in works" do
    visit root_path
    click_link 'login'
    assert_equal 200, page.status_code
    assert_equal timeline_index_path, current_path
    assert page.has_content?('jhitter')
    assert page.has_link?('logout')
  end

  test" a user can logout" do
    visit root_path
    click_link "login"
    assert_equal 200, page.status_code
    assert_equal timeline_index_path, current_path
    assert page.has_content?('jhitter')
    assert page.has_link?('logout')
    click_link "logout"
    assert_equal root_path, current_path
  end
end

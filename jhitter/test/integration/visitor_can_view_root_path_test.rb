require 'test_helper'

class VisitorCanViewRootPathTest < ActionDispatch::IntegrationTest
  test "that when a visitor visits my application they see a log in link" do
    visit root_path
    click_link "login"
    assert_equal timeline_index_path, current_path
    assert page.has_content?("logout")
    assert page.has_content?("new tweet")
  end
end

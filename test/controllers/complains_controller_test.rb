require 'test_helper'

class ComplainsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get complains_new_url
    assert_response :success
  end

  test "should get show" do
    get complains_show_url
    assert_response :success
  end

  test "should get index" do
    get complains_index_url
    assert_response :success
  end

end

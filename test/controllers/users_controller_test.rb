require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get users_edit_url
    assert_response :success
  end

  test "should get update" do
    get users_update_url
    assert_response :success
  end

  test "should get destoy" do
    get users_destoy_url
    assert_response :success
  end

  test "should get my_booking" do
    get users_my_booking_url
    assert_response :success
  end

  test "should get my_request" do
    get users_my_request_url
    assert_response :success
  end

end

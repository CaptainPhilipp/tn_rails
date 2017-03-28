require 'test_helper'

class CarriagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get carriages_index_url
    assert_response :success
  end

  test "should get show" do
    get carriages_show_url
    assert_response :success
  end

  test "should get new" do
    get carriages_new_url
    assert_response :success
  end

  test "should get create" do
    get carriages_create_url
    assert_response :success
  end

  test "should get edit" do
    get carriages_edit_url
    assert_response :success
  end

  test "should get update" do
    get carriages_update_url
    assert_response :success
  end

  test "should get destroy" do
    get carriages_destroy_url
    assert_response :success
  end

end

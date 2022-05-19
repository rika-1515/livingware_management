require "test_helper"

class Admin::MasterLivingwaresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_master_livingwares_index_url
    assert_response :success
  end

  test "should get edit" do
    get admin_master_livingwares_edit_url
    assert_response :success
  end

  test "should get new" do
    get admin_master_livingwares_new_url
    assert_response :success
  end
end

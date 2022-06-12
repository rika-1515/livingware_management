require "test_helper"

class Public::LivingwaresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_livingwares_index_url
    assert_response :success
  end

  test "should get new" do
    get public_livingwares_new_url
    assert_response :success
  end

  test "should get edit" do
    get public_livingwares_edit_url
    assert_response :success
  end
end

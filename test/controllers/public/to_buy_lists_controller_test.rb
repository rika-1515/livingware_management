require "test_helper"

class Public::ToBuyListsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_to_buy_lists_index_url
    assert_response :success
  end
end

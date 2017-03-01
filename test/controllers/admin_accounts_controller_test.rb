require 'test_helper'

class AdminAccountsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_accounts_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_accounts_show_url
    assert_response :success
  end

  test "should get update" do
    get admin_accounts_update_url
    assert_response :success
  end

  test "should get delete" do
    get admin_accounts_delete_url
    assert_response :success
  end

end

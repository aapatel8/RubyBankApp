require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
   include Devise::Test::ControllerHelpers

  setup do
    @account = accounts(:one)

  end

  test "should get index" do
    get accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_account_url
    assert_response :success
  end

  test "should create account" do
    assert_difference('Account.count') do
        post accounts_url, params: { account: { :AccountNumber => "123456789", :AccountName => "My Checking", :Balance => "999912341239", :status => "enabled", :Approved => true, :user_id => 1  } }
    end

    assert_redirected_to account_url(Account.last)
  end

  test "should show account" do
    get account_url(@account)
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)

    get edit_account_url(@account)
    assert_response :success

    sign_out users :one
  end

  test "should update account" do
    puts(Account.create!(:AccountNumber => "123456789", :AccountName => "My Checking", :Balance => "999912341239", :status => "enabled", :Approved => true, :user_id => 1).inspect)

    patch account_url(@account), params: { id: 123456789, account: { :Balance => 100, :AccountName => "Checking", :status => "enabled", :AccountNumber => "123456789" } }
    assert_redirected_to account_url(@account)
  end

  test "should destroy account" do
    assert_difference('Account.count', -1) do
      delete account_url(@account)
    end

    assert_redirected_to accounts_url
  end
end

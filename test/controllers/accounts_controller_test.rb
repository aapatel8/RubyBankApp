require 'test_helper'

class AccountsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
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
    user = User.create!(:email => "john.doe@email2.com", :password => "password1234")

    sign_in(user)
    account = user.accounts.create!(:AccountNumber => "123456789", :AccountName => "My Checking", :Balance => "999912341239", :status => "enabled", :Approved => true, :user_id => 1)

    assert account!= nil

    sign_out(user)
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
    user = User.create!(:email => "john.doe@email2.com", :password => "password1234")

    sign_in(user)
    account = user.accounts.create!(:AccountNumber => "123456789", :AccountName => "My Checking", :Balance => "999912341239", :status => "enabled", :Approved => true, :user_id => 1)

    account.update_attributes(:AccountName => "New Name")

    assert account.AccountName == "New Name" 

    sign_out(user)
  end

  test "should destroy account" do
    assert_difference('Account.count', -1) do
      delete account_url(@account)
    end

    assert_redirected_to accounts_url
  end
end

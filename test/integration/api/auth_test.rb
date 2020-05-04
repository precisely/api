require 'test_helper'

class AuthTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should create user with new email" do
    assert_difference('User.count') do
      post user_registration_url, params: { user: { 
        email: "foo@gmail.com", password: "test123123"
        } 
      }, as: :json
    end

    assert_response 201
  end

  test "should not create user with same email" do
    assert_no_difference('User.count') do
      post user_registration_url, params: { user: { email: @user.email } }, as: :json
    end

    assert_response 422
  end


end

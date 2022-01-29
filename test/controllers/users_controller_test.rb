# frozen_string_literal: true

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test 'should get index' do
    get signup_path
    assert_response :success
  end

  test 'should create user' do
    assert_difference('User.count') do
      post signup_path, params: { user: { username: @user.username } }
    end

    assert_redirected_to root_path(User.last)
  end

end

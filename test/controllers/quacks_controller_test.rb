require "test_helper"

class QuacksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quack = quacks(:one)
  end

  test "should get index" do
    get quacks_url
    assert_response :success
  end

  test "should get new" do
    get new_quack_url
    assert_response :success
  end

  test "should create quack" do
    assert_difference("Quack.count") do
      post quacks_url, params: { quack: {  } }
    end

    assert_redirected_to quack_url(Quack.last)
  end

  test "should show quack" do
    get quack_url(@quack)
    assert_response :success
  end

  test "should get edit" do
    get edit_quack_url(@quack)
    assert_response :success
  end

  test "should update quack" do
    patch quack_url(@quack), params: { quack: {  } }
    assert_redirected_to quack_url(@quack)
  end

  test "should destroy quack" do
    assert_difference("Quack.count", -1) do
      delete quack_url(@quack)
    end

    assert_redirected_to quacks_url
  end
end

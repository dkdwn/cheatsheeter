require "test_helper"

class CheatsControllerTest < ActionDispatch::IntegrationTest
  fixtures :users, :cheats
  setup do
    @cheat = cheats(:one)
    sign_in_as(users(:one))
  end

  test "should get index" do
    get cheats_url
    assert_response :success
  end

  test "should get new" do
    get new_cheat_url
    assert_response :success
  end

  test "should create cheat" do
    assert_difference("Cheat.count") do
      post cheats_url, params: { cheat: { category: @cheat.category, content: @cheat.content, name: @cheat.name } }
    end

    assert_redirected_to cheat_url(Cheat.last)
  end

  test "should show cheat" do
    get cheat_url(@cheat)
    assert_response :success
  end

  test "should get edit" do
    get edit_cheat_url(@cheat)
    assert_response :success
  end

  test "should update cheat" do
    patch cheat_url(@cheat), params: { cheat: { category: @cheat.category, content: @cheat.content, name: @cheat.name } }
    assert_redirected_to cheat_url(@cheat)
  end

  test "should destroy cheat" do
    assert_difference("Cheat.count", -1) do
      delete cheat_url(@cheat)
    end

    assert_redirected_to cheats_url
  end
end

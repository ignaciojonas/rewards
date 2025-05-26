require "test_helper"

class RewardTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @reward_type = reward_types(:one)
  end

  test "should get index" do
    get reward_types_url
    assert_response :success
  end

  test "should get new" do
    get new_reward_type_url
    assert_response :success
  end

  test "should create reward_type" do
    assert_difference("RewardType.count") do
      post reward_types_url, params: { reward_type: { description: @reward_type.description, name: @reward_type.name } }
    end

    assert_redirected_to reward_type_url(RewardType.last)
  end

  test "should show reward_type" do
    get reward_type_url(@reward_type)
    assert_response :success
  end

  test "should get edit" do
    get edit_reward_type_url(@reward_type)
    assert_response :success
  end

  test "should update reward_type" do
    patch reward_type_url(@reward_type), params: { reward_type: { description: @reward_type.description, name: @reward_type.name } }
    assert_redirected_to reward_type_url(@reward_type)
  end

  test "should destroy reward_type" do
    assert_difference("RewardType.count", -1) do
      delete reward_type_url(@reward_type)
    end

    assert_redirected_to reward_types_url
  end
end

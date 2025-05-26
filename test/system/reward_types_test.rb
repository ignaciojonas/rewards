require "application_system_test_case"

class RewardTypesTest < ApplicationSystemTestCase
  setup do
    @reward_type = reward_types(:one)
  end

  test "visiting the index" do
    visit reward_types_url
    assert_selector "h1", text: "Reward types"
  end

  test "should create reward type" do
    visit reward_types_url
    click_on "New reward type"

    fill_in "Description", with: @reward_type.description
    fill_in "Name", with: @reward_type.name
    click_on "Create Reward type"

    assert_text "Reward type was successfully created"
    click_on "Back"
  end

  test "should update Reward type" do
    visit reward_type_url(@reward_type)
    click_on "Edit this reward type", match: :first

    fill_in "Description", with: @reward_type.description
    fill_in "Name", with: @reward_type.name
    click_on "Update Reward type"

    assert_text "Reward type was successfully updated"
    click_on "Back"
  end

  test "should destroy Reward type" do
    visit reward_type_url(@reward_type)
    click_on "Destroy this reward type", match: :first

    assert_text "Reward type was successfully destroyed"
  end
end

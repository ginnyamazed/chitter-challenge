require "application_system_test_case"

class QuacksTest < ApplicationSystemTestCase
  setup do
    @quack = quacks(:one)
  end

  test "visiting the index" do
    visit quacks_url
    assert_selector "h1", text: "Quacks"
  end

  test "should create quack" do
    visit quacks_url
    click_on "New quack"

    click_on "Create Quack"

    assert_text "Quack was successfully created"
    click_on "Back"
  end

  test "should update Quack" do
    visit quack_url(@quack)
    click_on "Edit this quack", match: :first

    click_on "Update Quack"

    assert_text "Quack was successfully updated"
    click_on "Back"
  end

  test "should destroy Quack" do
    visit quack_url(@quack)
    click_on "Destroy this quack", match: :first

    assert_text "Quack was successfully destroyed"
  end
end

require "application_system_test_case"

class ReviewsTest < ApplicationSystemTestCase
  setup do
    @review = reviews(:one)
  end

  test "visiting the index" do
    visit reviews_url
    assert_selector "h1", text: "Reviews"
  end

  test "creating a Review" do
    visit reviews_url
    click_on "New Review"

    fill_in "Car model", with: @review.car_model_id
    fill_in "Comment", with: @review.comment
    fill_in "Owner name", with: @review.owner_name
    fill_in "Owner phone", with: @review.owner_phone
    fill_in "Requested price", with: @review.requested_price
    fill_in "Suggested price", with: @review.suggested_price
    click_on "Create Review"

    assert_text "Review was successfully created"
    click_on "Back"
  end

  test "updating a Review" do
    visit reviews_url
    click_on "Edit", match: :first

    fill_in "Car model", with: @review.car_model_id
    fill_in "Comment", with: @review.comment
    fill_in "Owner name", with: @review.owner_name
    fill_in "Owner phone", with: @review.owner_phone
    fill_in "Requested price", with: @review.requested_price
    fill_in "Suggested price", with: @review.suggested_price
    click_on "Update Review"

    assert_text "Review was successfully updated"
    click_on "Back"
  end

  test "destroying a Review" do
    visit reviews_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Review was successfully destroyed"
  end
end
